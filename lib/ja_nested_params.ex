defmodule JaNestedParams do
  @moduledoc """
  Parse `Json Api v1.0` parameters. Additionally, deviate from the specification
  by allowing the building of nested parameters, just like those consumed by 
  Ecto's changeset at initialization. 
  Make use of the `included` array of the Json Api specification. This does not
  conform to spec beacuse, as of v1.0, it does not expect compound documents 
  traveling from client side back to server.
  More over, leverage the `meta` object, within `resource linkage` and `resource
  object`, to allow the inclusion of new resources in the `included` array. 
  These new resources won't have an `id`, but still need to be distinguishable 
  among other new resources of the same type. 
  The `meta` object is expected to contain a member called `new-resource-tag` 
  whenever an object doesn't have an id yet. The value of `new-resource-tag` 
  must be unique within a group of new resources of the same type.
  If the primary data is not an array, but a single resource, no `id` member is
  needed if said resource is new, as provided by the specification. Nor anything
  needs to be said about it in the `meta` object.
  """

  
import Enum, only: [with_index: 1]



  @doc """
  Accept an Json Api-ish document that may have an `included` array, which may
  also caontain new resources that conform to the clauses explained above.
  

  """

  def to_attributes(%{"data" => data, "included" => included}) when is_list(included)  do
    as_attributes(data, included)
  end 
  
  def to_attributes(%{"data" => data, "included" => _}),  do: as_attributes(data, [])
  
  def to_attributes(%{"data" => data}), do: as_attributes(data, [])
  
  def to_attributes(data) when is_map(data), do: as_attributes(data, [])
  
  
  
  
  
  
  
  defp primary_linkage_key(%{"type" => _, "id" => _} = resource)  do
    resource
    |> Map.take(["type", "id"])
    |> linkage_key()
  end

  defp primary_linkage_key(%{"type" => type} ),  do:  {type,"",1}

  
  
  
  
  
  defp linkage_key(%{"meta" => %{"new-resource-tag" => newTag }, 
                     "type" => type} = resource)  when not is_nil(newTag) do
    case resource do
      %{"id" => nil}  ->  nil
      %{"id" => ""}  ->  nil
      %{"id" => id}  ->   {type,id,0}
      _ ->  {type,"",newTag}
    end
  end
  
  
  defp linkage_key(%{"type" => _, "id" => nil}),  do: nil


  defp linkage_key(%{"type" => type, "id" => id}),  do: {type,id,0}


  defp linkage_key(_),  do: nil
  
  
  
  




  defp add_id_member(struct, %{"id" => id}), do: Map.put_new(struct, "id", id)

  defp add_id_member(struct, _), do: struct
  
  
  
  
  
  


  defp as_attributes(data, included) do     
    id_key = primary_linkage_key data    
    includedSet = Map.new included, &({linkage_key(&1), &1})         
    { object , _ } =  repeat id_key, data , MapSet.new(), includedSet
    object
  end 
  
  

  defp follow_many(name,linkages,accum,included) do
    { branches, idList, newAccum } =
        Enum.reduce linkages, {[], [], accum}, fn(identifier, {many,ids,acc})->
          with {_, keyId, _} = newKey  <- linkage_key(identifier)
          do
            case included do
              %{^newKey => something } -> 
              
                {newBranch, oneMore} =
                  repeat(newKey, something, acc, included)
                  
                { [newBranch | many] ,
                  (if keyId == "", do: ids, else:  [keyId | ids]) ,
                  oneMore
                }
                
              _ ->
                { many, 
                  (if keyId == "", do: ids, else:  [keyId | ids]) ,
                  MapSet.put(acc, newKey) 
                }
                
            end 
            
          else 
             _ -> { many, ids, acc }
          end
        end
      { [ {name, Map.new(for {a, b} <- with_index(branches), do: {b, a})}, 
          {"#{name}_ids", idList}
        ] ,
        newAccum 
      }
  end



  defp follow_one(name,identifier,accum,included) do
    with {_, keyId, _} = newKey  <- linkage_key(identifier)
      do                
        case included do
          %{^newKey => something} ->
          
            {newBranch, oneMore} =      
              repeat(newKey, something, accum, included)
              
            { [ {name, newBranch} ] ++ 
                (if keyId == "", do: [], else:  [{"#{name}_id", keyId}]), 
              oneMore 
            }
            
          _ -> 
            { (if keyId == "", do: [], else:  [{"#{name}_id", keyId}]),
              MapSet.put(accum,newKey) 
            }
            
        end
        
      else                 
        _ -> { [], accum }
      end
  end              
  
  
  

  defp repeat(key, branch, visited, included) do
    visitedAndMe = MapSet.put(visited, key)      
    
    { params, increasedVisits } =
      case {MapSet.member?(visited, key), branch}  do             
        {false, %{"relationships" => rels} } ->          
          {propertyList, newVisited} =
            Enum.flat_map_reduce rels, visitedAndMe, fn
              ({name, %{"data" => nil}}, accum) ->
                { [ {"#{name}_id", nil} ] , accum }          
              ({name, %{"data" => linkages}}, accum) when is_list(linkages) ->
                follow_many(name, linkages, accum, included)
              ({name, %{"data" => identifier} }, accum) ->
                follow_one(name, identifier, accum, included)
              (_any, accum) -> 
                {[], accum}
            end
          {Map.new(propertyList), newVisited} 
        _ -> 
          {%{}, visitedAndMe}
      end    
      
    { Map.merge(params, branch["attributes"] || %{})
      |> add_id_member(branch)   , 
      increasedVisits
    }
  end
  
  

end

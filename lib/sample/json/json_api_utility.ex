defmodule JaNestedParamsTest.JsonApiUtility do 
@moduledoc false
  
  defp identifier  res  do 
    Map.take res , ["type", "id", "meta"]
  end
  
  def basic_linkage type, id do
    single_linkage  %{"type" =>  type, "id" => id}
  end 
  
  def multi_linkage(resources) when is_list(resources) do 
    %{"data" => Enum.map(resources,   &identifier/1)}
  end 
  
  def single_linkage  res  do 
    %{"data" =>  identifier(res)}
  end 

end 
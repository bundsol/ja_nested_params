defmodule JaNestedParamsTest.AssemblyJson do
  
  alias JaNestedParamsTest.AssyFileJson
  import JaNestedParamsTest.JsonApiUtility 
  
  def assembly01(chain_id) do 
    %{"type" => "assembly" ,
      "attributes" => 
        %{"name" => "30x40 Table"   , 
          "description" => "To eat over"
        } ,
      "relationships" => 
        %{"chain" => basic_linkage( "chain", chain_id) ,
          "assy_files" => 
            multi_linkage(
              [ AssyFileJson.assy_file01_c4() ,
                AssyFileJson.assy_file01_c2() ,
                AssyFileJson.assy_file01()
              ]
            )
        } ,
      "meta" => 
        %{"new-resource-tag" => "0001"
        }
    }
  end 
  
  
  def assembly02(chain_id) do 
    %{"type" => "assembly" ,
      "attributes" => 
        %{"name" => "14x35x80 Cabinet"   , 
          "description" => "To be keep merchandise on" 
        } ,
      "relationships" => 
        %{"chain" => basic_linkage( "chain", chain_id) ,
          "assy_files" => 
            multi_linkage(
              [ AssyFileJson.assy_file05() 
              ]
            )
        } ,
      "meta" => 
        %{"new-resource-tag" => "002"
        }
    }
  end
  
  
  def assembly_basic(chain_id) do 
    %{"type" => "assembly" ,
      "attributes" =>
        %{"name" => "30x100 wall panel"   , 
          "description" => "To be hung onto a wall" 
        } ,
      "relationships" => 
        %{"chain" => basic_linkage( "chain", chain_id) ,
        } ,
      "meta" => 
        %{"new-resource-tag" => "0003"
        }
    }
  end


end
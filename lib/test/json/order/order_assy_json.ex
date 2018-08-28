defmodule JaNestedParamsTest.OrderAssyJson do
  
  
  alias JaNestedParamsTest.AssemblyJson
  import JaNestedParamsTest.JsonApiUtility 
  
  def order_assy01(chain_id) do 
    %{"type" => "order_assy",
      "attributes" => 
        %{"qty" => 2 
        },
      "relationships" => 
        %{"assembly" => single_linkage(AssemblyJson.assembly01(chain_id))
        },
      "meta" => 
        %{"new-resource-tag" => "000001"
        }
    }
  end
  
  
  def order_assy02(chain_id) do 
    %{"type" => "order_assy",
      "attributes" => 
        %{"qty" => 3 
        } ,
      "relationships" => 
        %{"assembly" => single_linkage(AssemblyJson.assembly02(chain_id))
        } ,
      "meta" => 
        %{"new-resource-tag" => "00002"
        }
    }
  end 
  
  
  def order_assy_basic(chain_id) do 
    %{"type" => "order_assy",
      "attributes" => 
        %{"qty" => 3 
        },
      "relationships" => 
        %{"assembly" => single_linkage(AssemblyJson.assembly_basic(chain_id))
        } ,
      "meta" => 
        %{"new-resource-tag" => "00003"
        }
    }
  end 


end
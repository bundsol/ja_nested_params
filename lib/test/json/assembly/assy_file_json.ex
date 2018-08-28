defmodule JaNestedParamsTest.AssyFileJson do

  alias JaNestedParamsTest.FileJson
  import JaNestedParamsTest.JsonApiUtility 

  def assy_file01 do
    %{"type" => "assy_file" ,
      "attributes" => 
        %{"purpose" => "bom",
          "assy_qty" => 1
        } ,
      "relationships" => 
        %{"file" => single_linkage(FileJson.file01)
        },
      "meta" => 
        %{"new-resource-tag" => "00001"
        }
    }
  end
  
  
  def assy_file01_c2 do 
    %{"type" => "assy_file" ,
      "attributes" => 
        %{"purpose" => "bom",
          "assy_qty" => 2
        } ,
      "relationships" =>
        %{"file" => single_linkage(FileJson.file01_c2)
        } ,
      "meta" => 
        %{"new-resource-tag" => "000000002"
        }
    }
  end
  
  
  def assy_file01_c4 do 
    %{"type" => "assy_file" ,
      "attributes" => 
        %{"purpose" => "bom",
          "assy_qty" => 4
        } ,
      "relationships" => 
        %{"file" => single_linkage(FileJson.file01_c4)
        } ,
      "meta" => 
        %{"new-resource-tag" => "000000004"
        }  
    }
  end 
  
  
  def assy_file02_u1 do 
    %{"type" => "assy_file" ,
      "attributes" => 
        %{"purpose" => "bom",
          "assy_qty" => 2
        } ,
      "relationships" => 
        %{"file" => single_linkage(FileJson.file01_c2_u1)
        } ,
      "meta" => 
        %{"new-resource-tag" => "00000006"
        }  
    }
  end 
  
  
  def assy_file05 do 
    %{"type" => "assy_file" ,
      "attributes" => 
        %{"purpose" => "bom and views",
          "assy_qty" => 1,
        },
      "relationships" =>
        %{"file" => single_linkage(FileJson.file05)
        },
      "meta" => 
        %{"new-resource-tag" => "00005"
        }
    }
  end 

end 
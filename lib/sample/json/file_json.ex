defmodule JaNestedParamsTest.FileJson do
@moduledoc false

  def file01 do 
    %{"type" => "file" ,
      "attributes" => 
        %{"filename" => "Some 30 x 40 table.pdf", 
          "filetype" => "pdf",
          "subdir" => "some",
          "uploaded_file" => %{"for_testing_only" => true}
        } ,
      "meta" => 
        %{"new-resource-tag" => "0001"
        }
    }
  end
  
  
  def file01_c2 do 
    %{"type" => "file" ,
      "attributes" => 
        %{"filename" => "2count Some 30 x 40 table.pdf", 
          "filetype" => "pdf",
          "subdir" => "some 2c",
          "uploaded_file" => %{"for_testing_only" => true}
        } ,
      "meta" => 
        %{"new-resource-tag" => "0002"
        }
    }
  end
  
  
  def file01_c2_u1 do 
    %{"type" => "file" ,
      "attributes" => 
        %{"filename" => "2count Some 30 x 40 table december_2018.pdf", 
          "filetype" => "pdf",
          "subdir" => "some 2c dec18",
          "uploaded_file" => %{"for_testing_only" => true}
        } ,
      "meta" => 
        %{"new-resource-tag" => "0003"
        }
    }
  end
  
  
  def file01_c4 do 
    %{"type" => "file" ,
      "attributes" => 
        %{"filename" => "4 count Some 30 x 40 table.pdf ", 
          "filetype" => "pdf",
          "subdir" => "some 4c",
          "uploaded_file" => %{"for_testing_only" => true}
        } ,
      "meta" => 
        %{"new-resource-tag" => "00034"
        }
    } 
  end
      
      
 
      
  def file05 do 
    %{"type" => "file" ,
      "attributes" => 
        %{"filename" => "14 x 35 x 80 cabinet.pdf", 
          "filetype" => "pdf",
          "subdir" => "5th",
          "uploaded_file" => %{"for_testing_only" => true}
        } ,
      "meta" => 
        %{"new-resource-tag" => "0050"
        }
    }
  end 

end 
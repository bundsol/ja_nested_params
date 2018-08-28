defmodule JaNestedParamsTest.AddressJson do
@moduledoc false

  def address01 do
    %{"type" => "address" ,
      "attributes" => 
        %{"number" => "1325", 
          "street" => "Jefferson",
          "city" => "Stockton" ,
          "state" => "CA"
        } ,
      "meta" =>
        %{"new-resource-tag" => "0001"
        }
    }
  end 
  
  
  def address02 do
    %{"type" => "address" ,
      "attributes" => 
        %{"number" => "806", 
          "street" => "Rancho Grande",
          "city" => "Elk Grove" ,
          "state" => "CA"
        } ,
      "meta" => 
        %{"new-resource-tag" => "00002"
        }
    }
  end

end
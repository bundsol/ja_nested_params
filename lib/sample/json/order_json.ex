defmodule JaNestedParamsTest.OrderJson do
@moduledoc false
  
  alias JaNestedParamsTest.AddressJson
  alias JaNestedParamsTest.OrderAssyJson
  alias JaNestedParamsTest.AssemblyJson
  alias JaNestedParamsTest.AssyFileJson
  alias JaNestedParamsTest.FileJson
  
  import JaNestedParamsTest.JsonApiUtility 
  
 
  def order01(%{updater: updater, kooky: kooky , rumba: rumba}) do 
    %{"data" => 
        %{"type" => "file" ,
          "attributes" => 
            %{"status" => "writeup" ,
              "job_no" => 625, 
            } ,
          "relationships" => 
            %{"updater" => basic_linkage("user", updater.id) , 
              "chain" => basic_linkage( "chain", kooky.id) ,
              "sent_to" => single_linkage(AddressJson.address01),
              "intended_for" => single_linkage(AddressJson.address02),
              "order_assys" => 
                multi_linkage(
                  [ OrderAssyJson.order_assy01(kooky.id)  ,
                    OrderAssyJson.order_assy02(rumba.id) ,
                    OrderAssyJson.order_assy_basic(kooky.id)
                  ]
                )
            } 
        } ,
      "included" => 
        [ AddressJson.address01,
          AddressJson.address02,
          
          OrderAssyJson.order_assy01(kooky.id) ,
          AssemblyJson.assembly01(kooky.id) ,
          AssyFileJson.assy_file01_c4() ,
          FileJson.file01_c4 ,
          AssyFileJson.assy_file01_c2() ,
          FileJson.file01_c2 ,
          AssyFileJson.assy_file01() ,
          FileJson.file01 ,
          
          OrderAssyJson.order_assy02(rumba.id) ,
          AssemblyJson.assembly02(rumba.id) ,
          AssyFileJson.assy_file05()  ,
          FileJson.file05 ,
          
          OrderAssyJson.order_assy_basic(kooky.id) ,
          AssemblyJson.assembly_basic(kooky.id)
        ]
    }
  end 


end
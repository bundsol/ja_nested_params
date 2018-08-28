defmodule JaNestedParamsTest.Expected do

  alias JaNestedParamsTest.SeedObject
  
  def expected_result do 
       %{
          "job_no" => 625,
          "intended_for" => %{
            "city" => "Elk Grove",
            "number" => "806",
            "state" => "CA",
            "street" => "Rancho Grande"
          },
          "order_assys" => %{
            0 => %{
              "assembly" => %{
                "description" => "To be hung onto a wall",
                "name" => "30x100 wall panel",
                "chain_id" => SeedObject.kooky.id
              },
              "qty" => 3
            },
            1 => %{
              "assembly" => %{
                "assy_files" => %{
                  0 => %{
                    "assy_qty" => 1,
                    "file" => %{
                      "filename" => "14 x 35 x 80 cabinet.pdf",
                      "filetype" => "pdf",
                      "subdir" => "5th",
                      "uploaded_file" => %{"for_testing_only" => true}
                    },
                    "purpose" => "bom and views"
                  }
                },
                "assy_files_ids" => [],
                "description" => "To be keep merchandise on",
                "name" => "14x35x80 Cabinet",
                "chain_id" => SeedObject.rumba.id
              },
              "qty" => 3
            },
            2 => %{
              "assembly" => %{
                "assy_files" => %{
                  0 => %{
                    "assy_qty" => 1,
                    "file" => %{
                      "filename" => "Some 30 x 40 table.pdf",
                      "filetype" => "pdf",
                      "subdir" => "some",
                      "uploaded_file" => %{"for_testing_only" => true}
                    },
                    "purpose" => "bom"
                  },
                  1 => %{
                    "assy_qty" => 2,
                    "file" => %{
                      "filename" => "2count Some 30 x 40 table.pdf",
                      "filetype" => "pdf",
                      "subdir" => "some 2c",
                      "uploaded_file" => %{"for_testing_only" => true}
                    },
                    "purpose" => "bom"
                  },
                  2 => %{
                    "assy_qty" => 4,
                    "file" => %{
                      "filename" => "4 count Some 30 x 40 table.pdf ",
                      "filetype" => "pdf",
                      "subdir" => "some 4c",
                      "uploaded_file" => %{"for_testing_only" => true}
                    },
                    "purpose" => "bom"
                  }
                },
                "assy_files_ids" => [],
                "description" => "To eat over",
                "name" => "30x40 Table",
                "chain_id" => SeedObject.kooky.id
              },
              "qty" => 2
            }
          },
          "order_assys_ids" => [],
          "sent_to" => %{
            "city" => "Stockton",
            "number" => "1325",
            "state" => "CA",
            "street" => "Jefferson"
          },
          "status" => "writeup",
          "chain_id" => SeedObject.kooky.id,
          "updater_id" => SeedObject.renee.id
        }        
    end
    
end    
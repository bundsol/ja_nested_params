defmodule JaNestedParamsTest do
  use ExUnit.Case
  doctest JaNestedParams
  
  alias JaNestedParamsTest.OrderJson
  alias JaNestedParams
  
  import JaNestedParamsTest.Expected, only: [expected_result: 0] 
  alias JaNestedParamsTest.SeedObject
  
  setup do
  
    sample = 
      %{updater: SeedObject.renee, 
        kooky: SeedObject.kooky, 
        rumba: SeedObject.rumba
      }
      |> OrderJson.order01()
  
    %{sample: sample}
  end 

  test "matches typical Elixir nested params", %{sample: sample} do
    assert JaNestedParams.to_attributes(sample) == expected_result()
  end
end

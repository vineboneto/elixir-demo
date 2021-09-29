defmodule ListFilterTest do
  use ExUnit.Case

  test "call/1" do
    list = ["1", "2", "3", "banana"]
    response = ListFilter.call(list)
    expect_response = 2
    assert response == expect_response
  end
end

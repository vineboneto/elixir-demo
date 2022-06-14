defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns the user" do
      response = Item.build("Sorvete", :sobremesa, "10.50", 20)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there are invalid category, returns an error" do
      response = Item.build("Sorvete", :feijao, 10.50, 20)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there are invalid price, returns an error" do
      response = Item.build("Sorvete", :sobremesa, 0, 20)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there are invalid quantity, returns an error" do
      response = Item.build("Sorvete", :sobremesa, 10.5, 0)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end

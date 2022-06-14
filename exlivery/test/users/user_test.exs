defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("vinicius", "vineboneto@gmail.com", 22, "12345", "Rua John Doe")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("vinicius jn", "vineboneto@gmail.com", 15, "12345", "Rua John Doe")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end

defmodule Explane.Users.UserTest do
  use ExUnit.Case

  alias Explane.Users.User

  import Explane.Factory

  describe "build/4" do
    test "when all params are valid, returns the user" do
      response = User.build("vinicius", "vineboneto@gmail.com", "12345")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("vinicius jn", "vineboneto@gmail.com", 123)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end

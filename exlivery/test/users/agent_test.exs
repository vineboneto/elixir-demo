defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "saves the user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when user is found, returns the user" do
      :user
      |> build(cpf: "123456789")
      |> UserAgent.save()

      response = UserAgent.get("123456789")

      expected_response =
        {:ok,
         %User{
           address: "Rua John Doe",
           age: 22,
           cpf: "123456789",
           email: "vineboneto@gmail.com",
           name: "vinicius"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("00000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end

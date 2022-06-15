# defmodule Explane.Users.CreateOrUpdateTest do
#   alias Explane.Users.CreateOrUpdate
#   alias Explane.Users.Agent, as: UserAgent

#   use ExUnit.Case

#   describe "call/1" do
#     setup do
#       UserAgent.start_link(%{})
#       :ok
#     end

#     test "when all params are valid, saves the user" do
#       params = %{
#         name: "Vinicius",
#         email: "vineboneto@gmail.com",
#         cpf: "123456"
#       }

#       response = CreateOrUpdate.call(params)

#       expected_response = {:ok, "User created or updated successfully"}

#       assert response == expected_response
#     end

#     test "when all params are invalid, returns error" do
#       params = %{
#         name: "Vinicius",
#         email: "vineboneto@gmail.com",
#         cpf: 123
#       }

#       response = CreateOrUpdate.call(params)

#       expected_response = {:error, "Invalid parameters"}

#       assert response == expected_response
#     end
#   end
# end

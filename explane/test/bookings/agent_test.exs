# defmodule Explane.Users.AgentTest do
#   use ExUnit.Case

#   alias Explane.Users.Agent, as: UserAgent

#   import Explane.Factory

#   describe "save/1" do
#     setup do
#       UserAgent.start_link(%{})

#       :ok
#     end

#     test "saves the user" do
#       user = build(:user)

#       assert {:ok, _uuid} = UserAgent.save(user)
#     end
#   end

#   describe "get/1" do
#     setup do
#       UserAgent.start_link(%{})

#       :ok
#     end

#     test "when user is found, returns the user" do
#       user = build(:user)

#       {:ok, uuid} = UserAgent.save(user)

#       response = UserAgent.get(uuid)

#       expected_response = {:ok, user}

#       assert response == expected_response
#     end

#     test "when the user is not found, returns an error" do
#       response = UserAgent.get("00000")

#       expected_response = {:error, "User not found"}

#       assert response == expected_response
#     end
#   end
# end

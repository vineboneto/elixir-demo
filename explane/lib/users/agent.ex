defmodule Explane.Users.Agent do
  alias Explane.Users.User

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user) do
    uuid = UUID.uuid4()
    Agent.update(__MODULE__, fn state -> update_state(state, user, uuid) end)
    {:ok, uuid}
  end

  defp update_state(state, %User{} = user, uuid) do
    Map.put(state, uuid, user)
  end

  def get(uuid) do
    Agent.get(__MODULE__, fn state -> get_user(state, uuid) end)
  end

  defp get_user(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end

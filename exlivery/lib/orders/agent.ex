defmodule Exlivery.Orders.Agent do
  alias Exlivery.Orders.Order

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Order{} = order) do
    uuid = UUID.uuid4()
    Agent.update(__MODULE__, fn state -> update_state(state, order, uuid) end)
    {:ok, uuid}
  end

  def list_all do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def get(uuid) do
    Agent.get(__MODULE__, fn state -> get_order(state, uuid) end)
  end

  defp get_order(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "Order not found"}
      order -> {:ok, order}
    end
  end

  defp update_state(state, %Order{} = order, uuid) do
    Map.put(state, uuid, order)
  end
end

defmodule Explane.Bookings.CreateOrUpdateTest do
  alias Explane.Bookings.CreateOrUpdate
  alias Explane.Bookings.Agent, as: BookingAgent

  use ExUnit.Case

  describe "call/1" do
    setup do
      BookingAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, saves the booking" do
      params = %{
        complete_date: ~N[2018-01-01 15:24:00],
        local_destination: "Santa Catarina",
        local_origin: "São Paulo",
        user_id: UUID.uuid4()
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "Booking created or updated successfully"}

      assert response == expected_response
    end

    test "when all params are invalid, returns error" do
      params = %{
        complete_date: ~N[2018-01-01 15:24:00],
        local_destination: "Santa Catarina",
        local_origin: "São Paulo",
        user_id: 123
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end

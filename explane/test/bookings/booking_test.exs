defmodule Explane.Booking.BookingTest do
  use ExUnit.Case

  alias Explane.Bookings.Booking

  import Explane.Factory

  describe "build/4" do
    test "when all params are valid, returns the user" do
      uuid = UUID.uuid4()
      response = Booking.build(~N[2018-01-01T15:24:00], "São Paulo", "Santa Catarina", uuid)

      expected_response = {:ok, build(:booking, user_id: uuid)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = Booking.build(~N[2018-01-01T15:24:00], "São Paulo", "Santa Catarina", 123)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end

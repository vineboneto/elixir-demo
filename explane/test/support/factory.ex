defmodule Explane.Factory do
  use ExMachina

  alias Explane.Users.User
  alias Explane.Bookings.Booking

  def user_factory do
    %User{
      name: "vinicius",
      email: "vineboneto@gmail.com",
      cpf: "12345"
    }
  end

  def booking_factory do
    %Booking{
      complete_date: ~N[2018-01-01 15:24:00],
      local_destination: "Santa Catarina",
      local_origin: "São Paulo",
      user_id: UUID.uuid4()
    }
  end
end

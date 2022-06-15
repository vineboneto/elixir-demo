defmodule Explane do
  alias Explane.Users.Agent, as: UserAgent
  alias Explane.Bookings.Agent, as: BookingAgent
  alias Explane.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Explane.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_booking(params), to: CreateOrUpdateBooking, as: :call
end

defmodule Explane.Bookings.Report do
  alias Explane.Bookings.Agent, as: BookingAgent
  alias Explane.Bookings.Booking

  def create(from_date, to_date) do
    booking_list = build_booking_list(from_date, to_date)

    File.write("report.csv", booking_list)

    {:ok, "Report generated successfully"}
  end

  defp build_booking_list(from_date, to_date) do
    BookingAgent.list_all()
    |> Map.values()
    |> Enum.filter(fn x -> compare_date(x, from_date, to_date) end)
    |> Enum.map(fn booking -> booking_string(booking) end)
  end

  defp compare_date(
         %Booking{
           complete_date: complete_date
         },
         from_date,
         to_date
       ) do
    complete_date > from_date and complete_date < to_date
  end

  defp booking_string(%Booking{
         complete_date: complete_date,
         local_origin: local_origin,
         local_destination: local_destination,
         user_id: user_id
       }) do
    "#{user_id}, #{local_origin}, #{local_destination}, #{complete_date}\n"
  end
end

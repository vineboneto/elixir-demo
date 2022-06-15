defmodule Explane.Booking.ReportTest do
  use ExUnit.Case

  import Explane.Factory

  alias Explane.Bookings.Agent, as: BookingAgent
  alias Explane.Bookings.Report

  describe "create/1" do
    test "creates the report file" do
      BookingAgent.start_link(%{})
      uuid = UUID.uuid4()
      complete_date = ~N[2018-01-02 00:00:00]
      out_range_date = ~N[2018-01-05 00:00:00]

      :booking
      |> build(user_id: uuid, complete_date: complete_date)
      |> BookingAgent.save()

      :booking
      |> build(user_id: uuid, complete_date: complete_date)
      |> BookingAgent.save()

      :booking
      |> build(user_id: uuid, complete_date: out_range_date)
      |> BookingAgent.save()

      expected_response = {:ok, "Report generated successfully"}

      expected_content =
        "#{uuid}, São Paulo, Santa Catarina, #{complete_date}\n" <>
          "#{uuid}, São Paulo, Santa Catarina, #{complete_date}\n"

      response = Report.create(~N[2018-01-01 00:00:00], ~N[2018-01-03 23:59:59])

      content_file = File.read!("report.csv")

      assert content_file == expected_content

      assert response == expected_response
    end
  end
end

defmodule Flightex.Bookings.Report do
    alias Flightex.Bookings.Agent, as: BookingAgent
    alias Flightex.Bookings.Booking
    
    def build(from_date, to_date) do
        booking_list = build_booking_list(from_date, to_date)
        File.write!("booking_report.csv", booking_list)

        {:ok, "generated report"}
    end

    defp build_booking_list(%NaiveDateTime{} = from_date, %NaiveDateTime{} = to_date) do
        pull_bookings(from_date, to_date)
        |> map_bookings()
    end

    def pull_bookings(%NaiveDateTime{} = from_date, %NaiveDateTime{} = to_date) do
        bookings = BookingAgent.list_all()
          |> Enum.filter(fn {_booking_id, %Booking{complete_date: complete_date}} ->
            from = NaiveDateTime.compare(complete_date, from_date)
            to = NaiveDateTime.compare(complete_date, to_date)
    
            (from == :eq or from == :gt) and (to == :eq or to == :lt)
          end)
          |> Enum.map(fn {_booking_id, %Booking{} = booking} -> booking end)
        {:ok, bookings}
    end

    defp map_bookings({:ok, bookings}) do
        bookings
        |> Enum.map(&booking_string/1)
      end
    
    defp booking_string(%Booking{
            complete_date: complete_date,
            local_origin: local_origin,
              local_destination: local_destination,
             user_id: user_id
           }) do
        "#{user_id},#{local_origin},#{local_destination},#{NaiveDateTime.to_string(complete_date)}\n"
    end
end
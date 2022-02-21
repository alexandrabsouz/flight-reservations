defmodule Flightex.Bookings.Booking do
  @keys [:complete_date, :local_origin, :local_destination, :user_id, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(complete_date, local_origin, local_destination, user_id) do
    {:ok,
    %__MODULE__{
      complete_date: complete_date,
      local_origin: local_origin,
      local_destination: local_destination,
      user_id: user_id,
      id: UUID.uuid4()
    }}
  end

  # defp validate_naive_format(complete_date) do
  #   complete_date
  #   |> NaiveDateTime.from_iso8601()
  #   |> handle_date()
  # end

  # defp handle_date({:ok, complete_date}), do: {:ok, complete_date}

  # defp handle_date({:error, reason}), do: {:error, "date in inválid format"}
end

defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Bookings.Booking
  alias Flightex.Users.User

  def users_factory do
    %{
      id: UUID.uuid4(),
      name: "otavio",
      email: "otavio@banana.com",
      cpf: "3540968405"
    }
  end

  def booking_factory do
    %{
      complete_date: ~N[2003-05-07 03:05:00],
      local_origin: "Nova York",
      local_destination: "Floriculture",
      user_id: "3eb1e890-04e1-4f58-ae4a-7b1259d57c2d",
      id: UUID.uuid4()
  end
end

# `FLIGHTEX ✈`

<img src="https://github.com/alexandrabsouz/git-docs/blob/main/img/ignite.png" min-width="400px" max-width="300px" width="400px" align="right" alt="ignite img">
<br><br>

<p> In this challenge, you must create a flight booking application, where users will be registered and reservations will be registered for a user.
The user struct must have the following fields:</p>

```Elixir
%User{
  id: id,
  name: name,
  email: email,
  cpf: cpf
}
```

**Note:** The Id must be generated automatically, it can be an integer or a UUID, but it cannot be repeated.
The reservation struct must have the following fields: 

```Elixir
%Booking{
  id: id,
  complete_date: complete_date,
  local_origin: local_origin,
  local_destination: local_destination,
  user_id: user_id
}
```

The `complete_date` field must be a `NaiveDateTime`, which is a date format without time zone and with auxiliary functions.
More details about [NaiveDateTime here](https://hexdocs.pm/elixir/NaiveDateTime.html#content).

```
⚠️ It is important that all data is saved in an Agent, as seen in the module.
```

If you want to test your implementation from the terminal, run `iex -S mix` inside the project root directory.

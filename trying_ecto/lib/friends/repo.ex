defmodule Friends.Repo do
  use Ecto.Repo,
    otp_app: :trying_ecto,
    adapter: Ecto.Adapters.Postgres
end

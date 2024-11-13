defmodule Bbank.Repo do
  use Ecto.Repo,
    otp_app: :bbank,
    adapter: Ecto.Adapters.Postgres
end

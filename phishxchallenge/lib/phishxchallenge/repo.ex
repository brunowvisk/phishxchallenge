defmodule Phishxchallenge.Repo do
  use Ecto.Repo,
    otp_app: :phishxchallenge,
    adapter: Ecto.Adapters.Postgres
end

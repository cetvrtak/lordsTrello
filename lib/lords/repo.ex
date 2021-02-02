defmodule Lords.Repo do
  use Ecto.Repo,
    otp_app: :lords,
    adapter: Ecto.Adapters.Postgres
end

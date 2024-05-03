defmodule HexBank.Repo do
  use Ecto.Repo,
    otp_app: :hex_bank,
    adapter: Ecto.Adapters.Postgres
end

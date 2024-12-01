defmodule MiniMercado.Repo do
  use Ecto.Repo,
    otp_app: :mini_mercado,
    adapter: Ecto.Adapters.Postgres
end

defmodule MiniMercadoWeb.FallbackController do
  use MiniMercadoWeb, :controller

  def call(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(:"404")
  end

  def init(_type, _params) do
    {:ok, nil}
  end
end

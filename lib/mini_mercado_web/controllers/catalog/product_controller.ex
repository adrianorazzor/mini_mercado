defmodule MiniMercadoWeb.Catalog.ProductController do
  use MiniMercadoWeb, :controller


  alias MiniMercado.Catalog
  alias MiniMercado.Catalog.Product

  action_fallback MiniMercadoWeb.FallbackController

  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- Catalog.create_product(product_params) do
      conn
      |> put_status(:created)
      |> render("show.json", product: product)
    end
  end

  def show(conn, %{"barcode" => barcode}) do
    case Catalog.get_product_by_barcode(barcode) do
      nil -> send_resp(conn, :not_found, "")
      product -> render(conn, "show.json", product: product)
    end
  end
end

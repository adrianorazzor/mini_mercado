defmodule MiniMercado.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MiniMercado.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        barcode: "some barcode",
        name: "some name",
        price: "120.5"
      })
      |> MiniMercado.Catalog.create_product()

    product
  end
end

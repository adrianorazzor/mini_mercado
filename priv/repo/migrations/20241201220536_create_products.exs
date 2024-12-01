defmodule MiniMercado.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :barcode, :string
      add :price, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end

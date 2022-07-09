defmodule Phishxchallenge.Repo.Migrations.AddIndexTable do
  @moduledoc """
    
  """
  use Ecto.Migration

  def change do
    create table(:companyoverview, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :symbol, :string
      add :assetType, :string
      add :name, :string
      add :CIK, :integer
      add :Exchange, :string
      add :Currency, :string
      add :Country, :string
      add :Sector, :string
      add :Industry, :string
      add :Address, :string
      add :FiscalYearEnd, :string
      add :LatestQuarter, :date
      add :MarketCapitalization, :float
      add :EBITDA, :float
      add :EVToEBITDA, :float
      timestamps()
    end
  end
end

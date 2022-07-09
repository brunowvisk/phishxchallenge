defmodule Phishxchallenge.CompanyOverview do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "companyOverview" do
    field :Symbol, :string
    field :AssetType, :string
    field :Name, :string
    field :CIK, :integer
    field :Exchange, :string
    field :Currency, :string
    field :Country, :string
    field :Sector, :string
    field :Industry, :string
    field :Address, :string
    field :FiscalYearEnd, :string
    field :LatestQuarter, :date
    field :MarketCapitalization, :float
    field :EBITDA, :float
    field :EVToEBITDA, :float
    timestamps()
  end

  @required_fields [
    :Symbol,
    :AssetType,
    :Name,
    :CIK,
    :Exchange,
    :Currency,
    :Country,
    :Sector,
    :Industry,
    :Address,
    :FiscalYearEnd,
    :LatestQuarter,
    :MarketCapitaliztion,
    :EBITDA,
    :EVToEBITDA
  ]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end

end

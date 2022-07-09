defmodule Phishxchallenge.AvIndex do
  @moduledoc """
    In this module, we have build method and enforce keys and keys.
  """
  @keys [
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
    :MarketCapitalization,
    :EBITDA,
    :EVToEBITDA
  ]

  @enforce_keys @keys

  @derive Jason.Encoder
  defstruct @keys

  @doc """
    This method aims to build all information we need to insert in the database.
  """
  def build(%{
    "Symbol" => symbol,
    "AssetType" => assetType,
    "Name" => name,
    "CIK" => cik,
    "Exchange" => exchange,
    "Currency" => currency,
    "Country" => country,
    "Sector" => sector,
    "Industry" => industry,
    "Address" => address,
    "FiscalYearEnd" => fiscalYearEnd,
    "LatestQuarter" => latestQuarter,
    "MarketCapitalization" => marketCapitalization,
    "EBITDA" => ebitda,
    "EVToEBITDA" => evtoebitda
  }) do
  %__MODULE__{
        "Symbol": symbol,
        "AssetType": assetType,
        "Name": name,
        "CIK": cik,
        "Exchange": exchange,
        "Currency": currency,
        "Country": country,
        "Sector": sector,
        "Industry": industry,
        "Address": address,
        "FiscalYearEnd": fiscalYearEnd,
        "LatestQuarter": latestQuarter,
        "MarketCapitalization": marketCapitalization,
        "EBITDA": ebitda,
        "EVToEBITDA": evtoebitda
  }
  end

end

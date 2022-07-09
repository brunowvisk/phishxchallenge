defmodule Phishxchallenge.PhishxIndex.Create do
  @moduledoc """
    In this module, we have a create method to insert data in the Postgres Database.
  """

  alias Phishxchallenge.AlphaVantageApi.Client
  alias Phishxchallenge.AvIndex
  alias Phishxchallenge.CompanyOverview
  alias Phishxchallenge.Repo

  @doc """
    Call method is used to get data from the client file and create a new
  company overview in the database.
  """
  def call(%{"symbol" => symbol} = params) do
    symbol
    |> Client.get_companyoverview()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> AvIndex.build()
    |> create_phishx_companyoverview(params)
  end

  defp handle_response({:error, _msg} = error, _params), do: error

  @doc """
    This is the private function to create a new company overview.
  """
  defp create_phishx_companyoverview(
    %AvIndex{
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
    },
      %{}
    ) do
      params = %{
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
      params
      |> CompanyOverview.build()
      |> handle_build()
    end

    defp handle_build({:ok, companyoverview}), do: Repo.insert(companyoverview)
    defp handle_build({:error, _changeset} = error), do: error

end

defmodule Phishxchallenge.PhishxIndex.Create do
  alias Phishxchallenge.AlphaVantageApi.Client
  alias Phishxchallenge.AvIndex
  alias Phishxchallenge.PhishxIndex


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
    %{
      "EnterpriseValue": enterpriseValue

    }) do
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
        "EVToEBITDA": evtoebitda,
        "EnterpriseValue": enterpriseValue
      }
    end

end

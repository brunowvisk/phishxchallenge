defmodule PhishxchallengeWeb.PhishxCompanyoverviewView do
  use PhishxchallengeWeb, :view

  alias Phishxchallenge.CompanyOverview

  def render("create.json", %{
    companyoverview: %CompanyOverview{
      Symbol: symbol,
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
    } = companyoverview
  }) do
    %{
      message: "New company overview data created!",
      companyoverview: companyoverview
      # %{
      #   "Symbol": symbol,
      #   "AssetType": assetType,
      #   "Name": name,
      #   "CIK": cik,
      #   "Exchange": exchange,
      #   "Currency": currency,
      #   "Country": country,
      #   "Sector": sector,
      #   "Industry": industry,
      #   "Address": address,
      #   "FiscalYearEnd": fiscalYearEnd,
      #   "LatestQuarter": latestQuarter,
      #   "MarketCapitalization": marketCapitalization,
      #   "EBITDA": ebitda,
      #   "EVToEBITDA": evtoebitda
      # }
    }
  end

  def render("index.json", %{CompanyOverview: companyoverviews}) do
    Enum.map(companyoverviews, &render("show.json", %{companyoverview: &1}))
  end

end

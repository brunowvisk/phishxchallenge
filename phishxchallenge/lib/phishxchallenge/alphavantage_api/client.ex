defmodule Phishxchallenge.AlphavantageApi.Client do
  @moduledoc """
    This module aims to get data from Alpha Vantage API. Tesla Middleware is used here
  to get it.
  """
  use Tesla

  plug Tesla.Middleware.BaseUrl,
       "https://www.alphavantage.co"

  plug Tesla.Middleware.JSON

  @doc """
    This method is responsable to get by query companies overview. An Apikey is
  required for that.
  """
  def get_companyoverview(symbol) do
    "/query?function=OVERVIEW&symbol=#{symbol}&apikey=BWOIR5PDJEND9CXV"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}

  defp handle_get({:ok, %Tesla.Env{status: 404}}),
    do: {:error, %{message: "Unemployment index not found!", status: 404}}

  defp handle_get({:error, _reason} = error), do: error
end

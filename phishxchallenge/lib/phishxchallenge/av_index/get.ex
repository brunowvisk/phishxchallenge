defmodule Phishxchallenge.AvIndex.Get do
  alias Phishxchallenge.AlphavantageApi.Client
  alias Phishxchallenge.AvIndex

  def call(symbol) do
    symbol
    |> Client.get_companyoverview()
    |> handle_response()
  end

  defp handle_response({:ok, body}), do: {:ok, AvIndex.build(body)}
  defp handle_response({:error, _reason} = error), do: error
end

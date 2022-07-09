defmodule Phishxchallenge.AvIndex.Get do
  @moduledoc """
    In this module, we have a get method.
  """
  alias Phishxchallenge.AlphavantageApi.Client
  alias Phishxchallenge.AvIndex

  @doc """
    The call method is used here to get all data from companies overview.
  """
  def call(symbol) do
    symbol
    |> Client.get_companyoverview()
    |> handle_response()
  end

  defp handle_response({:ok, body}), do: {:ok, AvIndex.build(body)}
  defp handle_response({:error, _reason} = error), do: error
end

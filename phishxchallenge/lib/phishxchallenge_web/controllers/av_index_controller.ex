defmodule PhishxchallengeWeb.AvIndexController do
  use PhishxchallengeWeb, :controller

  action_fallback PhishxchallengeWeb.FallbackController

  def show(conn, %{"symbol" => symbol}) do
    symbol
    |> Phishxchallenge.fetch_companyoverview()
    |> handle_response(conn)
  end

  defp handle_response({:ok, companyoverview}, conn) do
    conn
    |> put_status(:ok)
    |> json(companyoverview)
  end

  defp handle_response({:error, _reason} = error, _conn), do: error

end

defmodule PhishxchallengeWeb.FallbackController do
  use PhishxchallengeWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(PhishxchallengeWeb.ErrorView)
    |> render("bad_request.json", result: result)
  end

end

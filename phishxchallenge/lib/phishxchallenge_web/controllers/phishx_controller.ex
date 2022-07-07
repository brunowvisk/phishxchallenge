defmodule PhishxchallengeWeb.PhishxController do
  use PhishxchallengeWeb, :controller

  action_fallback PhishxchallengeWeb.FallbackController

  def create(conn, params) do
    params
    |> Phishxchallenge.create_phishx_companyoverview()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, companyoverview}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, companyoverview: companyoverview)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

end

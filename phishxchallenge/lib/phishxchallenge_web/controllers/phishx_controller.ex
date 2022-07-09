defmodule PhishxchallengeWeb.PhishxController do
  use PhishxchallengeWeb, :controller

  alias Phishxchallenge
  alias Phishxchallenge.PhishxIndex.Get

  action_fallback PhishxchallengeWeb.FallbackController

  require Logger

  def create(conn, params) do
    params
    |> Phishxchallenge.create_phishx_companyoverview()
    |> handle_response(conn, "create.json", :created)
    # |> Logger.info("New company overview inserted at database!")
  end

  defp handle_response({:ok, companyoverview}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, companyoverview: companyoverview)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

  def index(conn, _params) do
    case Get.all_overviews() do
      companyoverviews when is_list(companyoverviews) ->
        conn
        |> put_status(:ok)
        |> render("index.json", companyoverview: companyoverviews)
      {:error, reason} ->
        conn
        |> put_status(400)
        |> render("error.json", result: reason)
    end
  end

end

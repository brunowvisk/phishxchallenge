defmodule PhishxchallengeWeb.PageController do
  use PhishxchallengeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

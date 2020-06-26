defmodule IdeaHubWeb.PageController do
  use IdeaHubWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

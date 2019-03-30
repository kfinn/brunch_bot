defmodule BrunchBotWeb.PageController do
  use BrunchBotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

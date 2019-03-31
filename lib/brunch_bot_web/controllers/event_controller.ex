defmodule BrunchBotWeb.EventController do
  use BrunchBotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", events: BrunchBot.Repo.all(BrunchBot.Event))
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", event: BrunchBot.Repo.get!(BrunchBot.Event, id))
  end
end

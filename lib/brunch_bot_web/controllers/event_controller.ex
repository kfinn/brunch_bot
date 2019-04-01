defmodule BrunchBotWeb.EventController do
  use BrunchBotWeb, :controller

  def index(conn, _) do
    events = BrunchBot.Repo.all(Ecto.assoc(conn.assigns[:current_user], :events))
    render(conn, "index.html", events: events)
  end

  def show(conn, %{"id" => id}) do
    event = BrunchBot.Repo.get!(Ecto.assoc(conn.assigns[:current_user], :events), id)
    render(conn, "show.html", event: event)
  end
end

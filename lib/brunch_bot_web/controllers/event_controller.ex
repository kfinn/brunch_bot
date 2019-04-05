defmodule BrunchBotWeb.EventController do
  use BrunchBotWeb, :controller

  def index(conn, _) do
    events =
      conn.assigns[:current_user]
      |> Ecto.assoc(:events)
      |> BrunchBot.Repo.all()
    render(conn, "index.html", events: events)
  end

  def show(conn, %{"id" => id}) do
    event =
      conn.assigns[:current_user]
      |> Ecto.assoc(:events)
      |> BrunchBot.Repo.get!(id)
    render(conn, "show.html", event: event)
  end

  def new(conn, params) do
    changeset =
      conn.assigns[:current_user]
      |> Ecto.build_assoc(:event_memberships)
      |> Ecto.build_assoc(:event)
      |> BrunchBot.Event.changeset(params["event"] || %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    changeset = BrunchBot.EventMembership.changeset(%BrunchBot.EventMembership{}, %{event: params["event"], user: conn.assigns[:current_user]})
    case BrunchBot.Repo.insert(changeset) do
      {:ok, event} ->
        conn
          |> redirect(to: Routes.event_path(conn, :show, event.id))
          |> halt()
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset.event)
    end
  end
end

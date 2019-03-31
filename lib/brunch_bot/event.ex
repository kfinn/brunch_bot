defmodule BrunchBot.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :starting_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:starting_at])
    |> validate_required([:starting_at])
  end
end

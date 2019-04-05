defmodule BrunchBot.EventVenue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "event_venues" do
    field :latitude, :decimal
    field :longitude, :decimal
    field :name, :string
    belongs_to :event, BrunchBot.Event

    timestamps()
  end

  @doc false
  def changeset(event_venue, attrs) do
    event_venue
    |> BrunchBot.Repo.preload(:event)
    |> cast(attrs, [:name, :latitude, :longitude])
    |> put_assoc(:event, attrs.event, required: true)
    |> validate_required([:name, :latitude, :longitude])
  end
end

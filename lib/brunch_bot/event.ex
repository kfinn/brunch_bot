defmodule BrunchBot.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :starting_at, :utc_datetime
    has_many :event_memberships, BrunchBot.EventMembership
    has_many :users, through: [:event_memberships, :user]

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:starting_at])
    |> validate_required([:starting_at])
  end
end

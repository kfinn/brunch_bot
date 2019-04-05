defmodule BrunchBot.EventMembership do
  use Ecto.Schema
  import Ecto.Changeset

  schema "event_memberships" do
    belongs_to :event, BrunchBot.Event
    belongs_to :user, BrunchBot.Coherence.User

    timestamps()
  end

  @doc false
  def changeset(event_membership, attrs) do
    event_membership
    |> BrunchBot.Repo.preload([:event, :user])
    |> cast(attrs, [:event_id, :user_id])
    |> put_assoc(:event, attrs.event)
    |> put_assoc(:user, attrs.user)
  end
end

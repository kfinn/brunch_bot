defmodule BrunchBot.Repo.Migrations.CreateEventMemberships do
  use Ecto.Migration

  def change do
    create table(:event_memberships) do
      add :user_id, :integer, null: false
      add :event_id, :integer, null: false

      timestamps()
    end

  end
end

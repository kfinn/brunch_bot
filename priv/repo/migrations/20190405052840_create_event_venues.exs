defmodule BrunchBot.Repo.Migrations.CreateEventVenues do
  use Ecto.Migration

  def change do
    create table(:event_venues) do
      add :name, :string
      add :latitude, :decimal
      add :longitude, :decimal
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:event_venues, [:event_id])
  end
end

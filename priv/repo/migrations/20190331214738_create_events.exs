defmodule BrunchBot.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :starting_at, :utc_datetime

      timestamps()
    end

  end
end

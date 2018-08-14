defmodule VoiceFactory.Repo.Migrations.CreateCelebs do
  use Ecto.Migration

  def change do
    create table(:celebs) do
      add :name, :string

      timestamps()
    end

  end
end

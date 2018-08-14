defmodule VoiceFactory.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do

      timestamps()
    end

  end
end

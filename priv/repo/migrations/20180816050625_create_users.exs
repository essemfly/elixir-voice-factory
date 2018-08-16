defmodule VoiceFactory.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :password, :string
      add :email, :string
      add :phone, :string

      timestamps()
    end

  end
end

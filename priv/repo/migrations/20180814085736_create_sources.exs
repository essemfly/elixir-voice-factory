defmodule VoiceFactory.Repo.Migrations.CreateSources do
  use Ecto.Migration

  def change do
    create table(:sources) do
      add :topic, :string
      add :video_url, :string
      add :full_text, :text

      timestamps()
    end

  end
end

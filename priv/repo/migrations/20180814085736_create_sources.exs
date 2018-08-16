defmodule VoiceFactory.Repo.Migrations.CreateSources do
  use Ecto.Migration

  def change do
    create table(:sources) do
      add :celeb_id, references(:celebs)
      add :topic, :string
      add :video_url, :string
      add :full_text, :string

      timestamps()
    end

  end
end

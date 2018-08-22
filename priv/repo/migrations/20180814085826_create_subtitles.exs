defmodule VoiceFactory.Repo.Migrations.CreateSubtitles do
  use Ecto.Migration

  def change do
    create table(:subtitles) do
      add :source_id, references(:sources)
      add :celeb_id, references(:celebs)
      
      add :text, :string
      add :from_time, :time
      add :to_time, :time
      add :time_length, :time

      timestamps()
    end

  end
end

defmodule VoiceFactory.Repo.Migrations.CreateSubtitles do
  use Ecto.Migration

  def change do
    create table(:subtitles) do
      add :source_id, references(:sources)
      add :from_time, :integer
      add :to_time, :integer
      add :text, :string
      add :time_length, :integer

      timestamps()
    end

  end
end

defmodule VoiceFactory.Repo.Migrations.CreateSubtitles do
  use Ecto.Migration

  def change do
    create table(:subtitles) do
      add :from_time, :string
      add :to_time, :string
      add :text, :string
      add :time_length, :string

      timestamps()
    end

  end
end

defmodule VoiceFactory.Subtitle do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__


  schema "subtitles" do
    belongs_to(:source, VoiceFactory.Source)

    field :from_time, :string
    field :text, :string
    field :time_length, :string
    field :to_time, :string

    timestamps()
  end

  @doc false
  def changeset(%Subtitle{} = subtitle, attrs) do
    subtitle
    |> cast(attrs, [:source_id, :from_time, :to_time, :text, :time_length])
    |> validate_required([:text])
  end
end

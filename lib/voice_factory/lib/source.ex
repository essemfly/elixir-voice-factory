defmodule VoiceFactory.Source do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  schema "sources" do
    belongs_to(:celeb, VoiceFactory.Celeb)

    field(:topic, :string)
    field(:video_url, :string)
    field(:full_text, :string)

    timestamps()
  end

  @doc false
  def changeset(%Source{} = source, attrs) do
    source
    |> cast(attrs, [:celeb_id, :topic, :video_url, :full_text])
    |> validate_required([:topic, :video_url, :full_text])
  end
end
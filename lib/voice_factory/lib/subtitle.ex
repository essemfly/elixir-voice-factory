defmodule VoiceFactory.Subtitle do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias VoiceFactory.Repo

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "subtitles" do
    belongs_to(:source, VoiceFactory.Source)
    belongs_to(:celeb, VoiceFactory.Celeb)

    field(:text, :string)
    field(:from_time, :time)
    field(:to_time, :time)
    field(:time_length, :time)

    timestamps()
  end

  @doc false
  def changeset(%Subtitle{} = subtitle, attrs) do
    subtitle
    |> cast(attrs, [:source_id, :celeb_id, :from_time, :to_time, :text, :time_length])
    |> validate_required([:text])
  end

  def create(attrs) do
    {:ok, subtitle} =
      %Subtitle{}
      |> changeset(attrs)
      |> Repo.insert()

    subtitle |> Repo.preload(:source) |> Repo.preload(:celeb)
  end
end

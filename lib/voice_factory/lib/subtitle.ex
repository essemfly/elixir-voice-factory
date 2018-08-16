defmodule VoiceFactory.Subtitle do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias VoiceFactory.Repo

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "subtitles" do
    belongs_to(:source, VoiceFactory.Source)

    field(:from_time, :integer)
    field(:text, :string)
    field(:time_length, :integer)
    field(:to_time, :integer)

    timestamps()
  end

  @doc false
  def changeset(%Subtitle{} = subtitle, attrs) do
    subtitle
    |> cast(attrs, [:source_id, :from_time, :to_time, :text, :time_length])
    |> validate_required([:text])
  end

  def create(attrs) do
    {:ok, subtitle} =
      %Subtitle{}
      |> changeset(attrs)
      |> Repo.insert()

    subtitle |> Repo.preload(:source)
  end
end

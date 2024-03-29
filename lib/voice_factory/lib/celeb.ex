defmodule VoiceFactory.Celeb do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias VoiceFactory.Repo

  @derive {Poison.Encoder, except: [:__meta__]}

  schema "celebs" do
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(%Celeb{} = celeb, attrs) do
    celeb
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create(attrs) do
    {:ok, celeb} =
      %Celeb{}
      |> changeset(attrs)
      |> Repo.insert()

    celeb
  end
end

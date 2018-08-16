defmodule VoiceFactory.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias Comeonin.Bcrypt

  schema "users" do
    field(:email, :string)
    field(:password, :string)
    field(:phone, :string)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end

  defp put_pass_hash(changeset), do: changeset
end

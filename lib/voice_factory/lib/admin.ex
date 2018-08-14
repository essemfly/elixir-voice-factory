defmodule VoiceFactory.Admin do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  alias VoiceFactory.Repo
  alias VoiceFactory.Encryption


  schema "admins" do
    field(:email, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(%Admin{} = admin, attrs \\ %{}) do
    admin
    |> cast(attrs, [:email, :password, :name])
    |> validate_email()
    |> validate_password()
    |> put_password_hash()
  end

  def update_changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name], empty_values: [])
    |> validate_email()
  end

  def get(id), do: Repo.get(Admin, id) |> filter_password_hash()

  def get_by_authentication(email, password) do
    with %Admin{} = admin <- Repo.get_by(Admin, email: email),
          true <- Encryption.validate_password(password, admin.password_hash) do
      admin |> filter_password_hash()
    else
      _ -> nil
    end
  end

  def list(), do: Repo.all(Admin)

  def create(attrs) do
    %Admin{}
    |> changeset(attrs)
    |> Repo.insert()
    |> filter_password_hash()
  end

  def update(admin, attrs) do
    admin
    |> Admin.update_changeset(attrs)
    |> Repo.update()
    |> filter_password_hash()
  end

  def delete(%Admin{} = admin) do
    Repo.delete(admin)
  end

  defp validate_email(changeset) do
    changeset
    |> validate_required(:email)
    |> unique_constraint(:email)
    |> validate_change(:email, fn _, email ->
      case Regex.match?(~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]+$/, email) do
        false -> [email: "is invalid"]
        true -> []
      end
    end)
  end

  defp validate_password(changeset) do
    changeset
    |> validate_change(:password, fn _, password ->
      case Regex.match?(~r/^(?=.*([a-zA-Z]))(?=.*\d)(?=.*(_|[^\w]))[^\s.+^\s]{8,100}$/, password) do
        false -> [password: "is invalid"]
        true -> []
      end
    end)
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Encryption.hash_password(password))

      _ ->
        changeset
    end
  end

  defp filter_password_hash({:ok, %Admin{} = admin}),
    do: {:ok, %Admin{admin | password_hash: nil}}

  defp filter_password_hash(%Admin{} = admin), do: %Admin{admin | password_hash: nil}
  defp filter_password_hash(any), do: any
end

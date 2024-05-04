defmodule HexBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @required_params [:name, :password, :email, :cep]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  # thats how ecto will communicate to the database
  # what it will change and what will be changed as function params
  # changeset can be used to both insertion and updating
  def changeset(user \\ %__MODULE__{}, params) do # %__MODULE__{} == an empty map of HexBank.Users.User
    user
    |> cast(params, @required_params) # mapping what will be updated to what the app expects
    |> validate_required(@required_params) # fields that are required, that can't be null
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
    |> unique_constraint(:email, name: :unique_users_email)
    |> add_password_hash()
  end

  # receives a valid changeset with a changed password
  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, %{password_hash: Argon2.hash_pwd_salt(password)})
  end

  # if password didnt change, just return the changeset
  defp add_password_hash(changeset), do: changeset
end

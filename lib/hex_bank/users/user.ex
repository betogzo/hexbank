defmodule HexBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @required_params_create [:name, :password, :email, :cep]
  @required_params_update [:name, :email, :cep]

  # derive behavior when encoding to json, to show only id, name and email fields
  @derive {Jason.Encoder, only: [:id, :name, :email]}
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params_create)
    |> do_validations(@required_params_create)
    |> add_password_hash()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_params_create)
    |> do_validations(@required_params_update)
    |> add_password_hash()
  end

  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
    |> unique_constraint(:email, name: :unique_users_email)
  end

  # receives a valid changeset with a changed password
  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, %{password_hash: Argon2.hash_pwd_salt(password)})
  end

  # if password didnt change, just return the changeset
  defp add_password_hash(changeset), do: changeset
end

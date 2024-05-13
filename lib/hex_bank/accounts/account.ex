defmodule HexBank.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias HexBank.Users.User

  @required_params [:balance, :user_id]

  @derive {Jason.Encoder, only: [:id, :balance]}
  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User # defining relationship with User (account belongs to user)

    timestamps()
  end

  def changeset(account \\ %__MODULE__{}, params) do
    account
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:balance, name: :balance_must_be_positive)
    |> unique_constraint(:user_id, name: :unique_users_id)
  end
end

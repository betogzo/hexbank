defmodule HexBank.Accounts.Create do
  alias HexBank.Users.User
  alias HexBank.Accounts.Account
  alias HexBank.Repo

  def call(%{"user_id" => user_id} = params) do
    case Repo.get(User, user_id) do
      %User{} ->
        params
        |> Account.changeset()
        |> Repo.insert()

      nil ->
        {:error, :not_found}
    end
  end
end

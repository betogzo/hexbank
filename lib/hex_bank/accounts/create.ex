defmodule HexBank.Accounts.Create do
  alias HexBank.Accounts.Account
  alias HexBank.Repo

  def call(params) do # TODO = verify if the user exists before creating account
    params
    |> Account.changeset()
    |> Repo.insert()
  end
end

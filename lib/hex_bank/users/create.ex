defmodule HexBank.Users.Create do
  alias HexBank.Users.User
  alias HexBank.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end

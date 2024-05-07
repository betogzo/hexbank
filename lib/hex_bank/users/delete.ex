defmodule HexBank.Users.Delete do
  alias HexBank.Users.User
  alias HexBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end

defmodule HexBank.Users.Get do
  alias HexBank.Users.User
  alias HexBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end

defmodule HexBankWeb.UsersJSON do
  alias HexBank.Users.User

  def create(%{user: user}) do
    %{
      status: "ok",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end
end

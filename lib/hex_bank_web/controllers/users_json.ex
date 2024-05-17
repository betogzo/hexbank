defmodule HexBankWeb.UsersJSON do
  # alias HexBank.Users.User

  def create(%{user: user}) do
    %{
      status: "ok",
      # data: data(user)
      data: user
    }
  end

  def get(%{user: user}) do
    %{
      status: "ok",
      data: user
    }
  end

  def update(%{user: user}) do
    %{
      status: "ok",
      data: user
    }
  end

  def login(%{bearer: token}) do
    %{
      status: "ok",
      bearer: token
    }
  end

  def delete(%{}) do
    %{}
  end

  # commented, since @derive Jason.Encoder on user schema
  # will be responsible for what properties will be shown
  # when user data is encoded to JSON

  # defp data(%User{} = user) do
  #   %{
  #     id: user.id,
  #     name: user.name,
  #     email: user.email
  #   }
  # end
end

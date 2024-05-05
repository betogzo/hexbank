defmodule HexBankWeb.UsersController do
  use HexBankWeb, :controller

  alias HexBank.Users
  alias Users.User
  alias HexBankWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    # if Create.call(params) doesnt match {:ok, %User{} = user} the fallback will be called
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end

  # params are received as strings, not atoms
  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end
end

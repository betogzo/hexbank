defmodule HexBankWeb.AccountsController do
  use HexBankWeb, :controller

  alias HexBank.Accounts
  alias Accounts.Account

  alias HexBankWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, transaction} <- Accounts.transaction(params) do
      IO.inspect(transaction)

      conn
      |> put_status(:ok)
      |> render(:transaction, transaction: transaction)
    end
  end
end

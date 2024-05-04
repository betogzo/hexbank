defmodule HexBankWeb.FallbackController do
  use HexBankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: HexBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end

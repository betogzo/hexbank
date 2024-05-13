defmodule HexBankWeb.AccountsJSON do

  def create(%{account: account}) do
    %{
      status: "ok",
      data: account
    }
  end
end

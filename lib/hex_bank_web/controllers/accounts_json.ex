defmodule HexBankWeb.AccountsJSON do
  def create(%{account: account}) do
    %{
      status: "ok",
      data: account
    }
  end

  def transaction(%{transaction: %{withdraw: from_account, deposit: to_account}}) do
    %{
      status: "ok",
      from_account: from_account.id,
      to_account: to_account.id
    }
  end
end

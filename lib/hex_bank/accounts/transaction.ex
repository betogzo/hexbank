defmodule HexBank.Accounts.Transaction do
  alias HexBank.Accounts.Account
  alias HexBank.Repo
  alias Ecto.Multi

  def call(%{"from_account_id" => from_acc_id, "to_account_id" => to_acc_id, "value" => value}) do
    with %Account{} = from_acc <- Repo.get(Account, from_acc_id),
         %Account{} = to_acc <- Repo.get(Account, to_acc_id),
         {:ok, value} <- Decimal.cast(value) do
      Multi.new()
      |> withdraw(from_acc, value)
      |> deposit(to_acc, value)
      |> Repo.transaction()
      |> handle_transaction_result()
    else
      nil -> {:error, :not_found}
      :error -> {:error, :bad_request}
    end
  end

  def call(_), do: {:error, :bad_request}

  defp withdraw(multi, from_acc, value) do
    new_balance = Decimal.sub(from_acc.balance, value)
    changeset = Account.changeset(from_acc, %{balance: new_balance})
    Multi.update(multi, :withdraw, changeset)
  end

  defp deposit(multi, to_acc, value) do
    new_balance = Decimal.add(to_acc.balance, value)
    changeset = Account.changeset(to_acc, %{balance: new_balance})
    Multi.update(multi, :deposit, changeset)
  end

  defp handle_transaction_result({:ok, _result} = result), do: result
  defp handle_transaction_result({:error, _1, reason, _2}), do: {:error, reason}
end

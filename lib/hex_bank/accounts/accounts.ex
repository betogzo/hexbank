defmodule HexBank.Accounts do
  alias HexBank.Accounts.Create
  alias HexBank.Accounts.Transaction

  defdelegate create(params), to: Create, as: :call
  defdelegate transaction(from_account_id, to_account_id, value), to: Transaction, as: :call
end

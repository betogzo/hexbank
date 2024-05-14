defmodule HexBank.Accounts do
  alias HexBank.Accounts.Create
  alias HexBank.Accounts.Transaction

  defdelegate create(params), to: Create, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end

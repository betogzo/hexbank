defmodule HexBank.Accounts do
  alias HexBank.Accounts.Create

  defdelegate create(params), to: Create, as: :call
end

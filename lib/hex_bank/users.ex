# file to implement the facade design pattern on the users context
defmodule HexBank.Users do
  # HexBank.Users.create will actually call the function HexBank.Users.Create.call
  defdelegate create(params), to: HexBank.Users.Create, as: :call

  defdelegate get(id), to: HexBank.Users.Get, as: :call

  defdelegate delete(id), to: HexBank.Users.Delete, as: :call

  defdelegate update(params), to: HexBank.Users.Update, as: :call

  defdelegate login(params), to: HexBank.Users.Verify, as: :call
end

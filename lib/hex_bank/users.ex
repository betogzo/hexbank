# file to implement the facade design pattern on the users context
defmodule HexBank.Users do

  # HexBank.Users.create will actually call the function HexBank.Users.Create.call
  defdelegate create(params), to: HexBank.Users.Create, as: :call
end

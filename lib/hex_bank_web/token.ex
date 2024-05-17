defmodule HexBankWeb.Token do
  alias Phoenix.Token

  @sign_salt "yoursaltkeyhere"

  def sign(user) do
    IO.inspect(user)
    Token.sign(HexBankWeb.Endpoint, @sign_salt, %{user_id: user.id})
  end

  def verify(token) do
    case Token.verify(HexBankWeb.Endpoint, @sign_salt, token) do
      {:ok, _data} = result -> result
      {:error, _error} = error -> error
    end
  end
end

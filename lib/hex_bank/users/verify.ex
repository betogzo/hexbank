defmodule HexBank.Users.Verify do
  alias HexBank.Users

  def call(%{"id" => id, "password" => password}) do
    case Users.get(id) do
      {:ok, user} -> verify(user, password)
      {:error, _} = error -> error
    end
  end

  defp verify(user, password) do
    case Argon2.verify_pass(password, user.password_hash) do
      true -> {:ok, :valid_password}
      false -> {:ok, :unauthorized}
    end
  end
end

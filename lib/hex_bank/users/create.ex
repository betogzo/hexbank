defmodule HexBank.Users.Create do
  alias HexBank.Users.User
  alias HexBank.Repo
  alias HexBank.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- client().call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end

  # works similar to dependency injection depending on the environment
  # when in development environment, it will serve what we defined on /test/test_helper.exs
  # when in production, it will use ViaCepClient
  defp client() do
    Application.get_env(:hex_bank, :via_cep_client, ViaCepClient)
  end
end

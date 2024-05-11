defmodule HexBank.Users.Create do
  alias HexBank.Users.User
  alias HexBank.Repo
  alias HexBankWeb.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepClient.call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end
end

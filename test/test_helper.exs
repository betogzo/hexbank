Mox.defmock(HexBank.ViaCep.ClientMock, for: HexBank.ViaCep.ClientBehaviour)
Application.put_env(:hex_bank, :via_cep_client, HexBank.ViaCep.ClientMock)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(HexBank.Repo, :manual)

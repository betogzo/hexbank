defmodule HexBank.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias HexBank.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "successfully returns cep data when a valid cep is provided", %{bypass: bypass} do
      cep = "87300005"

      body = ~s({
        "bairro": "Centro",
        "cep": "87300-005",
        "complemento": "de 1191/1192 a 2519/2520",
        "ddd": "44",
        "gia": "",
        "ibge": "4104303",
        "localidade": "Campo Mourão",
        "logradouro": "Avenida Capitão Índio Bandeira",
        "siafi": "7483",
        "uf": "PR"
      })

      expected_response =
        {:ok,
         %{
           "bairro" => "Centro",
           "cep" => "87300-005",
           "complemento" => "de 1191/1192 a 2519/2520",
           "ddd" => "44",
           "gia" => "",
           "ibge" => "4104303",
           "localidade" => "Campo Mourão",
           "logradouro" => "Avenida Capitão Índio Bandeira",
           "siafi" => "7483",
           "uf" => "PR"
         }}

      Bypass.expect(bypass, fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response =
        bypass.port
        |> endpoint_url()
        |> Client.call(cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end

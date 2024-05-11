defmodule HexBankWeb.UsersControllerTest do
  use HexBankWeb.ConnCase

  import Mox

  alias HexBank.Users
  alias Users.User

  setup do
    params = %{
      "name" => "Beto",
      "cep" => "87300005",
      "password" => "12345",
      "email" => "teste@email.com"
    }

    body = %{
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
    }

    {:ok, %{user_params: params, body: body}}
  end

  describe "create/2" do
    test "successfully creates an user", %{
      conn: conn,
      user_params: params,
      body: body
    } do
      # mocking viacep response on user creation
      expect(HexBank.ViaCep.ClientMock, :call, fn "87300005" -> {:ok, body} end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{"email" => "teste@email.com", "id" => _id, "name" => "Beto"},
               "status" => "ok"
             } = response
    end

    test "returns an error when invalid params are provided", %{conn: conn} do
      params = %{
        name: nil,
        cep: "12",
        password: "12345",
        email: "teste@email.com"
      }

      expect(HexBank.ViaCep.ClientMock, :call, fn "12" -> {:ok, ""} end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      assert %{
               "errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]},
               "message" => "error"
             } = response
    end
  end

  describe "delete/2" do
    test "successfully deletes an user when a valid id is provided", %{
      conn: conn,
      user_params: params,
      body: body
    } do
      expect(HexBank.ViaCep.ClientMock, :call, fn "87300005" -> {:ok, body} end)

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:no_content)

      assert %{} = response
    end
  end
end

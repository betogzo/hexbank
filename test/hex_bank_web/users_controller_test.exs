defmodule HexBankWeb.UsersControllerTest do
  use HexBankWeb.ConnCase

  alias HexBank.Users
  alias Users.User

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do
      params = %{
        "name" => "Beto",
        "cep" => "87300005",
        "password" => "12345",
        "email" => "teste@email.com"
      }

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
        cep: "87300005",
        password: "12345",
        email: "teste@email.com"
      }

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
    test "successfully deletes an user when a valid id is provided", %{conn: conn} do
      params = %{
        "name" => "Beto",
        "cep" => "87300005",
        "password" => "12345",
        "email" => "teste@email.com"
      }

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:no_content)

      assert %{} = response
    end
  end
end

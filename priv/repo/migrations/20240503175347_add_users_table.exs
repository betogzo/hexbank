defmodule HexBank.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add :name, :string, null: false
      add :password_hash, :string, null: false
      add :email, :string, null: false
      add :cep, :string, null: false

      timestamps() #to manage inserted_at and updated_at
    end
  end
end

defmodule HexBank.Repo.Migrations.AddUniqueConstraintToUsersEmail do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:email], name: :unique_users_email)
  end
end

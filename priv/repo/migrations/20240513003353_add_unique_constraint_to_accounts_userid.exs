defmodule HexBank.Repo.Migrations.AddUniqueConstraintToAccountsUserid do
  use Ecto.Migration

  def change do
    create unique_index(:accounts, [:user_id], name: :unique_users_id)
  end
end

defmodule Bbank.Repo.Migrations.AddAccountsTable do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid)
      add :balance, :decimal, default: 0

      timestamps()
    end

    create constraint(:accounts, :balance_must_be_positive, check: "balance >= 0")
    create unique_index(:accounts, [:user_id])
  end
end

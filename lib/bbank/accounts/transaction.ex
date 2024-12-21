defmodule Bbank.Accounts.Transaction do
  alias Bbank.Accounts
  alias Accounts.Account
  alias Bbank.Repo
  alias Ecto.Multi

  def call(from_account_id, to_account_id, value) do
    with {:ok, from_account} <- Accounts.get(from_account_id),
         {:ok, to_account} <- Accounts.get(to_account_id),
         {:ok, value} <- Decimal.cast(value) do
      Multi.new()
      |> withdraw(from_account, value)
      |> deposit(to_account, value)
      |> Repo.transaction()
    end
  end

  defp withdraw(multi, %Account{} = account, value) do
    new_balance = Decimal.sub(account.balance, value)
    updated_changeset = Account.changeset(account, %{balance: new_balance})

    Multi.update(multi, :withdraw, updated_changeset)
  end

  defp deposit(multi, %Account{} = account, value) do
    new_balance = Decimal.add(account.balance, value)
    updated_changeset = Account.changeset(account, %{balance: new_balance})

    Multi.update(multi, :deposit, updated_changeset)
  end
end

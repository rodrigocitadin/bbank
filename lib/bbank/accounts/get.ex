defmodule Bbank.Accounts.Get do
  alias Bbank.Accounts.Account
  alias Bbank.Repo

  def call(id) do
    case Repo.get(Account, id) do
      nil -> {:error, :not_found}
      account -> {:ok, account}
    end
  end
end

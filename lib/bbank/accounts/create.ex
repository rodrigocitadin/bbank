defmodule Bbank.Accounts.Create do
  alias Bbank.Accounts.Account
  alias Bbank.Repo

  def call(params) do
    params
    |> Account.changeset()
    |> Repo.insert()
  end
end

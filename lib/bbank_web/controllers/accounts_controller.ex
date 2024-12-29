defmodule BbankWeb.AccountsController do
  alias Bbank.Accounts
  alias Accounts.Account

  use BbankWeb, :controller

  action_fallback BbankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, account: account)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Account{} = account} <- Accounts.get(id) do
      conn
      |> render(:get, account: account)
    end
  end

  def transaction(conn, %{
        "from_account_id" => from_account_id,
        "to_account_id" => to_account_id,
        "value" => value
      }) do
    with {:ok, transaction} <- Accounts.transaction(from_account_id, to_account_id, value) do
      conn
      |> put_status(:ok)
      |> render(:transaction, transaction: transaction)
    end
  end
end

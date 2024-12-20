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
end

defmodule BbankWeb.UsersController do
  alias Bbank.Users
  alias Users.User

  use BbankWeb, :controller

  action_fallback BbankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end

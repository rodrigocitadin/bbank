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

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> render(:get, user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> render(:update, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _} <- Users.delete(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def index(conn, _params) do
    users = Users.all()

    conn
    |> render(:all, users: users)
  end
end

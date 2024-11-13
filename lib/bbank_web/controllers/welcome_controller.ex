defmodule BbankWeb.WelcomeController do
  use BbankWeb, :controller

  def index(conn, params) do
    IO.inspect(conn)
    IO.inspect(params)

    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome", status: "ok"})
  end
end

defmodule BbankWeb.FallbackController do
  use BbankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: BbankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end


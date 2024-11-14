defmodule BbankWeb.UsersController do
  alias Bbank.Users.{Create, User}
  use BbankWeb, :controller

  action_fallback BbankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end

  # defp handle_response({:error, changeset}, conn) do
  #   conn
  #   |> put_status(:bad_request)
  #   |> put_view(json: BbankWeb.ErrorJSON)
  #   |> render(:error, changeset: changeset)
  # end
end

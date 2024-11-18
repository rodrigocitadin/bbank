defmodule Bbank.Users.Create do
  alias Bbank.Users.User
  alias Bbank.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end

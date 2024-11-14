defmodule Bbank.Users.Get do
  alias Bbank.Users.User
  alias Bbank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end

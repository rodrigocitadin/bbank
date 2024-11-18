defmodule Bbank.Users.Delete do
  alias Bbank.Users.User
  alias Bbank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end

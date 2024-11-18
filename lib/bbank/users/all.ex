defmodule Bbank.Users.All do
  alias Bbank.Users.User
  alias Bbank.Repo

  def call(), do: Repo.all(User)
end

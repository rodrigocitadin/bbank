defmodule Bbank.Factory do
  use ExMachina.Ecto, repo: MyApp.Repo

  use Bbank.UserFactory
end


defmodule Bbank.Users do
  alias Bbank.Users.{Create, Get, Update}

  defdelegate create(params), to: Create, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate get(params), to: Get, as: :call
end

defmodule Bbank.Users do
  alias Bbank.Users.{Create, Get, Update, Delete, All}

  defdelegate create(params), to: Create, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(params), to: Delete, as: :call
  defdelegate get(params), to: Get, as: :call
  defdelegate all(), to: All, as: :call
end

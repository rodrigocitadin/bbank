defmodule Bbank.Accounts do
  alias Bbank.Accounts.{Create, Get}

  defdelegate create(params), to: Create, as: :call
  defdelegate get(params), to: Get, as: :call
end

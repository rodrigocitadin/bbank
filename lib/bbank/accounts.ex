defmodule Bbank.Accounts do
  alias Bbank.Accounts.{Create, Get, Transaction}

  defdelegate create(params), to: Create, as: :call
  defdelegate get(params), to: Get, as: :call
  defdelegate transaction(from_account_id, to_account_id, value), to: Transaction, as: :call
end

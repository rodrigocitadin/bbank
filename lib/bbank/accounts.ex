defmodule Bbank.Accounts do
  alias Bbank.Accounts.Create

  defdelegate create(params), to: Create, as: :call
end

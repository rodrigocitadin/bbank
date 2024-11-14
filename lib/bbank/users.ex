defmodule Bbank.Users do
  alias Bbank.Users.Create

  defdelegate create(params), to: Create, as: :call
end

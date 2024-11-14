defmodule Bbank.Users do
  alias Bbank.Users.{Create, Get}

  defdelegate create(params), to: Create, as: :call
  defdelegate get(params), to: Get, as: :call
end

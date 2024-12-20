defmodule BbankWeb.AccountsJSON do
  def create(%{account: account}) do
    %{
      message: "Account created",
      data: account
    }
  end
end

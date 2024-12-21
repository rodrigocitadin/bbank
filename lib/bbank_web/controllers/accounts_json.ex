defmodule BbankWeb.AccountsJSON do
  def create(%{account: account}) do
    %{
      message: "Account created",
      data: account
    }
  end

  def get(%{account: account}) do
    %{
      message: "Account found",
      data: account
    }
  end
end

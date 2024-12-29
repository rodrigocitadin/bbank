defmodule BbankWeb.AccountsJSON do
  def create(%{account: account}) do
    %{
      message: "Account created",
      data: account
    }
  end

  def transaction(%{transaction: transaction}) do
    %{
      message: "Transaction done with success",
      data: transaction
    }
  end

  def get(%{account: account}) do
    %{
      message: "Account found",
      data: account
    }
  end
end

defmodule BbankWeb.UsersJSON do
  def create(%{user: user}) do
    %{
      message: "User created",
      data: user
    }
  end

  def get(%{user: user}) do
    %{
      message: "User found",
      data: user
    }
  end
end

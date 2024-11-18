defmodule BbankWeb.UsersJSON do
  def create(%{user: user}) do
    %{
      message: "User created",
      data: user
    }
  end

  def update(%{user: user}) do
    %{
      message: "User updated",
      data: user
    }
  end

  def get(%{user: user}) do
    %{
      message: "User found",
      data: user
    }
  end

  def all(%{users: users}) do
    %{
      message: "All user records",
      data: users
    }
  end
end

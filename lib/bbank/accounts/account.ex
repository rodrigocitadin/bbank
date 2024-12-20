defmodule Bbank.Accounts.Account do
  use Bbank.Schema
  import Ecto.Changeset

  alias Bbank.Users.User

  @account_fields [:user_id]

  @derive {Jason.Encoder, only: [:id, :user_id, :balance]}
  schema "accounts" do
    field :balance, :decimal, default: 0
    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @account_fields)
    |> validate_required(@account_fields)
    |> unique_constraint(:user_id)
    |> check_constraint(:balance, name: :balance_must_be_positive)
  end
end

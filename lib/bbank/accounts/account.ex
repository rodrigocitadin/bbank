defmodule Bbank.Accounts.Account do
  use Bbank.Schema
  import Ecto.Changeset

  alias Bbank.Users.User

  @account_fields [:user_id]
  @required_fields [:balance | @account_fields]

  @derive {Jason.Encoder, only: [:id, :user_id, :balance]}
  schema "accounts" do
    field :balance, :decimal, default: 0
    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> do_validations(params, @account_fields)
  end

  def changeset(account, params) do
    account
    |> do_validations(params, @required_fields)
  end

  defp do_validations(changeset, params, cast_params, required_params \\ @required_fields) do
    changeset
    |> cast(params, cast_params)
    |> validate_required(required_params)
    |> unique_constraint(:user_id)
    |> check_constraint(:balance, name: :balance_must_be_positive)
  end
end

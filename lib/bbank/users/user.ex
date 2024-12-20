defmodule Bbank.Users.User do
  use Bbank.Schema
  import Ecto.Changeset

  alias Bbank.Accounts.Account

  @user_fields [:name, :password, :email]
  @update_fields List.delete(@user_fields, :password)

  @derive {Jason.Encoder, only: [:name, :email, :id]}
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    has_one :account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> do_validations(params, @user_fields)
    |> put_pass_hash()
  end

  def changeset(user, params) do
    user
    |> do_validations(params, @update_fields)
    |> put_pass_hash()
  end

  defp do_validations(changeset, params, required_params) do
    changeset
    |> cast(params, @user_fields)
    |> validate_required(required_params)
    |> validate_length(:name, min: 3)
    |> validate_length(:password, min: 8)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(
      changeset,
      gen_pass_hash(password)
    )
  end

  defp put_pass_hash(changeset), do: changeset

  defp gen_pass_hash(password) do
    hash = Argon2.hash_pwd_salt(password)

    %{password_hash: hash, password: nil}
  end
end

defmodule Bbank.Users.User do
  use Bbank.Schema
  import Ecto.Changeset

  @user_fields [:name, :password, :email]

  @derive {Jason.Encoder, only: [:name, :email, :id]}
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @user_fields)
    |> validate_required(@user_fields)
    |> validate_length(:name, min: 3)
    |> validate_length(:password, min: 8)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_pass_hash()
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

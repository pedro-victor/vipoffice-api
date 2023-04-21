defmodule VipOffice.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :auth0_id, :string
    field :email, :string
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :auth0_id])
    |> validate_required([:username, :email, :password, :auth0_id])
  end
end

defmodule VipOffice.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :password, :string
      add :auth0_id, :string

      timestamps()
    end
  end
end

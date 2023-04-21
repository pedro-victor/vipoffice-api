defmodule VipOffice.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VipOffice.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        auth0_id: "some auth0_id",
        email: "some email",
        password: "some password",
        username: "some username"
      })
      |> VipOffice.Accounts.create_user()

    user
  end
end

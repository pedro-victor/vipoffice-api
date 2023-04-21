defmodule VipOfficeWeb.Router do
  use VipOfficeWeb, :router

  alias VipOffice.Auth.Permissions

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authorization do
    plug VipOffice.Auth.Authorize
  end

  @doc """
  Authorized if the request has `read:admin-message` in the bearer token claims
  """
  pipeline :validate_permissions do
    plug VipOffice.Auth.ValidatePermission, Permissions.read_admin_messages()
  end

  scope "/api", VipOfficeWeb, as: :api do
    pipe_through :api

    scope "/messages" do
      get "/public", MessageController, :public
    end
  end

  scope "/api", VipOfficeWeb, as: :api do
    pipe_through [:api, :authorization]

    resources "/users", UserController, except: [:new, :edit]

    scope "/messages" do
      get "/protected", MessageController, :protected
    end
  end

  scope "/api", VipOfficeWeb, as: :api do
    pipe_through [:api, :authorization, :validate_permissions]

    scope "/messages" do
      get "/admin", MessageController, :admin
    end
  end
end

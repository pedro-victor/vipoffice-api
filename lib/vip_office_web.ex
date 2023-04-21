defmodule VipOfficeWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use VipOfficeWeb, :controller
      use VipOfficeWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: VipOfficeWeb

      import Plug.Conn
      alias VipOfficeWeb.Router.Helpers, as: Routes
    end
  end

  @doc false
  def html do
    quote do
      @moduledoc false
      use Phoenix.Component

      unquote(view_helpers())
    end
  end

  @doc false
  def live_view do
    quote do
      @moduledoc false
      use Phoenix.LiveView
      unquote(view_helpers())
    end
  end

  @doc false
  def live_component do
    quote do
      @moduledoc false
      use Phoenix.LiveComponent
      unquote(view_helpers())
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  defp view_helpers do
    quote do
      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      # Import convenience functions for LiveView rendering
      import Phoenix.LiveView.Helpers

      # Import dashboard built-in functions
      import Phoenix.LiveDashboard.Helpers
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end

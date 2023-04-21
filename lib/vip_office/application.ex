defmodule VipOffice.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VipOfficeWeb.Telemetry,
      # Start the Ecto repository
      VipOffice.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: VipOffice.PubSub},
      # Start the Endpoint (http/https)
      VipOfficeWeb.Endpoint,
      # Start a worker by calling: VipOffice.Worker.start_link(arg)
      # {VipOffice.Worker, arg}
      VipOffice.Auth.Auth0Strategy
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VipOffice.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VipOfficeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule MiniMercado.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MiniMercadoWeb.Telemetry,
      MiniMercado.Repo,
      {DNSCluster, query: Application.get_env(:mini_mercado, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MiniMercado.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MiniMercado.Finch},
      # Start a worker by calling: MiniMercado.Worker.start_link(arg)
      # {MiniMercado.Worker, arg},
      # Start to serve requests, typically the last entry
      MiniMercadoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MiniMercado.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MiniMercadoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

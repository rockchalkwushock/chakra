defmodule Chakra.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Chakra.Repo,
      # Start the Telemetry supervisor
      ChakraWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Chakra.PubSub},
      # Start the Endpoint (http/https)
      ChakraWeb.Endpoint
      # Start a worker by calling: Chakra.Worker.start_link(arg)
      # {Chakra.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chakra.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ChakraWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

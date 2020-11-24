defmodule Studygroup.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Studygroup.Repo,
      # Start the Telemetry supervisor
      StudygroupWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Studygroup.PubSub},
      # Start the Endpoint (http/https)
      StudygroupWeb.Endpoint
      # Start a worker by calling: Studygroup.Worker.start_link(arg)
      # {Studygroup.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Studygroup.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StudygroupWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

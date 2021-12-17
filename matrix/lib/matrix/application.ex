defmodule Matrix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias Matrix.Server

  @impl true
  def start(_type, _args) do
    IO.puts("Starting Application")

    children = [
      # Starts a worker by calling: Matrix.Worker.start_link(arg)
      Server.child_spec(:ethan),
      Server.child_spec(:steve),
      Server.child_spec(:paul),
      Server.child_spec(:joel)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Matrix.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

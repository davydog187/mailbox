defmodule Mailbox.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Mailbox.Worker.start_link(arg)
      # {Mailbox.Worker, arg}
      Mailbox.Server,
      Mailbox.Worker
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mailbox.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

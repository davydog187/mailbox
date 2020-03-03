defmodule Mailbox.Worker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, :ok, {:continue, :fill_mailbox}}
  end

  def handle_continue(:fill_mailbox, state) do
    for num <- 1..1000 do
      send Mailbox.Server, num
    end

    send Mailbox.Server, :wait_then_exit

    for num <- 1001..2000 do
      send Mailbox.Server, num
    end

    {:noreply, state}
  end

end

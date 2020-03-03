defmodule Mailbox.Server do
use GenServer, restart: :transient

  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, :ok}
  end

  def handle_info(:wait_then_exit, state) do
    Process.sleep(1_000)

    {:message_queue_len, mailbox_size} = Process.info(self(), :message_queue_len)

    Logger.info("Server shutting down num_messages=#{mailbox_size}")

    {:stop, :normal, state}
  end

  def handle_info(num, state) do
    Logger.info("Server received #{num}")

    {:noreply, state}
  end

end

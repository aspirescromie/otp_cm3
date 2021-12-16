defmodule Plank.Server do
  alias Plank.Core
  use GenServer

  # Callbacks
  # init state
  @impl true
  def init(string) do
    {:ok, Core.new(string)}
  end

  # should return a value
  @impl true
  def handle_call(:count, _from, counter) do
    {:reply, Core.message(counter), counter}
  end

  @impl true
  def handle_cast(:inc, counter) do
    {:noreply, Core.inc(counter)}
  end

  # Client
  def start_link(string) do
    GenServer.start_link(__MODULE__, string)
  end

  def inc(counter_pid) do
    GenServer.cast(counter_pid, :inc)
  end

  def count(counter_pid) do
    GenServer.call(counter_pid, :count)
  end
end

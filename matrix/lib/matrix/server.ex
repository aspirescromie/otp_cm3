defmodule Matrix.Server do
  use GenServer
  alias Matrix.Server

  def init(answer) do
    {:ok, :unimplemented}
  end

  def handle_call(:render, _from, board) do
    # calculate new board
    {:reply, :value_for_client, :value_for_server}
  end

  def handle_cast(:guess, board) do
    {:noreply, :value_for_server}
  end
end

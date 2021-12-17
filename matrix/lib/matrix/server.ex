defmodule Matrix.Server do
  use GenServer
  alias Matrix.Board



  def init(maybe_answer) do
    answer =
      maybe_answer ||
      (1..8 |> Enum.shuffle() |> Enum.take(4))
    {:ok, Board.new(answer)}
  end

  def handle_call(:render, _from, board) do
    # calculate new board
    {:reply, Board.show(board), board}
  end

  #State is ALWAYS the last parameter
  def handle_cast({:guess, turn}, board) do
    {:noreply, Board.guess(board, turn)}
  end
end

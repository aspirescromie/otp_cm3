defmodule Matrix.Server do
  use GenServer
  alias Matrix.Board

  def init(maybe_answer) do
    IO.puts("Initializing #{inspect(maybe_answer)}")

    answer =
      maybe_answer ||
        1..8 |> Enum.shuffle() |> Enum.take(4)

    {:ok, Board.new(answer)}
  end

  def handle_call({:guess, turn}, _from, board) do
    new_board = Board.guess(board, turn)
    {:reply, Board.show(new_board), new_board}
  end

  def start_link(name) do
    IO.puts("Processing start link, #{name}")
    GenServer.start_link(__MODULE__, nil, name: name)
  end

  def guess(server \\ __MODULE__, turn) do
    server
    |> GenServer.call({:guess, turn})
    |> IO.puts()
  end

  def child_spec(name) do
    %{id: name, start: {Matrix.Server, :start_link, [name]}}
  end
end

defmodule Matrix.Board do
  defstruct [:answer, :guesses]
  alias Matrix.Score
  ## Constructor: take in user input and builds a map containing answers and the user's input

  def new(answer) do
    %__MODULE__{answer: answer, guesses: []}
  end

  ## Reducer: take in answers and compare them against user input

  def guess(board, turn) do
    board
    |> Map.put(:guesses, [turn | board.guesses])
  end

  ## Converter: return a message to user (right or wrong?)

  def show(board) do
    """
    #{rows(board)}
    #{status(board)}
    """
  end

  defp rows(board) do
    board.guesses
    |> Enum.map(&row(&1, board.answer))
    |> Enum.join("\n")
  end

  defp row(guess, answer) do
    Score.new(guess, answer)
    |> Score.show(guess)
  end

  defp status(board) do
    cond do
      board.answer == List.first(board.guesses) -> :won
      Enum.count(board.guesses) >= 10 -> :lost
      true -> :playing
    end
  end
end

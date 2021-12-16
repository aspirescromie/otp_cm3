defmodule Matrix.Board do

  defstruct [:answers, :guesses]
  ## Constructor: take in user input and builds a map containing answers and the user's input

  def new(answer) do
    %__MODULE__{answers: answer, guesses: []}
  end

  ## Reducer: take in answers and compare them against user input

  def guess(board, turn) do
    board
    |> Map.put(:guesses, [ turn | board.guesses ])
  end

  ## Converter: return a message to user (right or wrong?)

  def result() do
    #



  end

end

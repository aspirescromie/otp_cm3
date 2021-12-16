defmodule Matrix.Score do
  defstruct [:reds, :whites]
  # new - takes answer and guess, returns score

  def new(guess, answer) do
    slots = 4
    reds = answer |> Enum.zip(guess) |> Enum.filter(fn {a, b} -> a == b end) |> Enum.count
    misses = (guess -- answer) |> Enum.count
    whites = slots - reds - misses
    %__MODULE__{reds: reds, whites: whites}
  end

  # show - show the answer to the user
  def show(score, guess) do
    string_guess = Enum.join(guess)
    string_score = String.duplicate("R", score.reds) <> String.duplicate("W", score.whites)

    "#{string_guess} | #{string_score}"
  end
end

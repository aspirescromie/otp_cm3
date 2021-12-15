defmodule Plank do
  @moduledoc """
  Documentation for `Plank`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Plank.hello()
      :world

  """
  def new(string) do
    %{count: String.to_integer(string)}
  end

  def inc(%{count: x}) do
    %{count: x + 1}
  end

  def message(%{count: y}) do
    "My favorite numbarrrr is #{y}!!!"
  end
end

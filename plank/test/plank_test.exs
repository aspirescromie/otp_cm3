defmodule PlankTest do
  use ExUnit.Case
  doctest Plank

  test "greets the world" do
    assert Plank.hello() == :world
  end
end

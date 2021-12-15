defmodule Plank.Service do
  alias Plank.Core

  def start(string) do
    initial_counter = Core.new(string)
    spawn(fn -> loop(initial_counter))
  end

  def loop(counter) do
    counter
    |> listen()
    |> loop()
  end

  def listen(counter) do
    receive do
      :inc ->
        Core.inc(counter)

      {:count, from} ->
        response = Core.message(counter)
        send(from, response)
        counter
    end
  end
end

defmodule Plank.Service do
  alias Plank.Core

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

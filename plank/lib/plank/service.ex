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

  ## Client API below this line

  def start(string) do
    initial_counter = Core.new(string)
    spawn(fn -> loop(initial_counter) end)
  end

  def inc(counter_pid) do
    send(counter_pid, :inc)
    :ok
  end

  def count(counter_pid) do
    send(counter_pid, {:count, self()})
    receive do
      message -> message
    end
  end

end

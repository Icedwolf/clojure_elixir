defmodule Fibonacci do
  def compute(n) do # compute/1
    cond do
      n == 0 -> 0
      n == 1 -> 1
      true -> compute(n - 1) + compute(n - 2) # true = else (=! nil false) 
    end
  end
end

defmodule Fibonacci2 do #more elixir like solution
  def compute(0), do: 0 # elixir pattern-matching if the arg is = to 0 this gets executed
  def compute(1), do: 1 # = 1 do this
  def compute(n), do: compute(n - 1) + compute(n - 2) # else
end

defmodule Fibonacci3 do #optimized func
  def compute(0), do: 0
  def compute(1), do: 1
  def compute(n), do: helper(n, 2, 1, 1)

  defp helper(n, current_index, current_value, _) #defp = private function | _ optional arg
  when n == current_index do #guard clause
    current_value
  end

  defp helper(n, current_index, current_value, previous_value) do
    new_current_value = current_value + previous_value

    helper(n, current_index + 1, new_current_value, current_value)
  end
end

defmodule FibonacciI do
  def compute(n) do
    {0, 1}
    |> Stream.iterate(fn {a, b} -> {b, a + b} end) #elixir iteration |> = pipe
    |> Stream.map(&elem(&1,0)) #Stream.iterate({0, 1}, fn {a, b} -> {b, a + b} end) | & captures a function | &1 get the first args of a fun
    |> Enum.at(n) #convert stream to list
  end
end

IO.puts Fibonacci.compute(25)
IO.puts Fibonacci2.compute(25)
IO.puts Fibonacci3.compute(25)

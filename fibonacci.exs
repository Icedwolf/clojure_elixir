defmodule Fibonacci do
  def compute(n) do
    cond do
      n == 0 -> 0
      n == 1 -> 1
      true -> compute(n - 1) + compute(n - 2)
    end
  end
end
IO.puts Fibonacci.compute(25) 

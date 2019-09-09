defmodule Fibonacci do
  def compute(n) do # compute/1
    cond do
      n == 0 -> 0
      n == 1 -> 1
      true -> compute(n - 1) + compute(n - 2) # true = else (=! nil false) 
    end
  end
end
IO.puts Fibonacci.compute(25) 

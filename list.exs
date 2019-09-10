list = [3.14, :pie, "Apple"]
# Elixir implements list collections as linked lists. This means that accessing the list length is an operation that will run in linear time (O(n)). "For this reason, it is typically faster to prepend than to append:
# prepend = fast
["π" | list]
# appending = slow
list ++ ["Cherry"]
# list concat
# ++/2 -> function + arrity(number of args)
[1, 2] ++ [3, 4, 1] = [1, 2, 3, 4, 1]
# list subtraction / safe for missing value --/2 | :bar = symbol
# uses strict comparison 2.0 != 2
["foo", :bar, 42] -- [42, "bar"] = ["foo", :bar]
# head = hd | tail = tl
# hd = first | tl = rest
hd list = 3.14
tl list = [:pie, "Apple"]
# pattern matching and cons operator "|" (destructuring)
[head | tail] = list # ["π", 3.14, :pie, "Apple", "Cherry"]
head = "π"
tail = [3.14, :pie, "Apple", "Cherry"]
# tuples
# Tuples are similar to lists, but are stored contiguously in memory. This makes accessing their length fast but modification expensive; the new tuple must be copied entirely to memory. Tuples are defined with curly braces:
# It is common for tuples to be used as a mechanism to return additional information from functions;
tuple = {3.14, :pie, "Apple"}
# Keyword lists -> commonly used to pass options to functions
# Keys are atoms.
# Keys are ordered.
# Keys do not have to be unique.
[foo: "bar", hello: "world"]
[{:foo, "bar"}, {:hello, "world"}]
# maps
# the go-to key-value store, any type of keys and un-ordered %{}
map = %{:foo => "bar", "hello" => :world}
map[:foo] = "bar"
%{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"} # evals to true
map.foo = "bar"
%{map | foo: "baz"} # update foo value to baz

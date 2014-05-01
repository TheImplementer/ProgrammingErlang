-module(math_functions_tests).
-export([test_even/0, test_odd/0, test_split_accumulator/0, test_split_filter/0]).
-import(math_functions, [even/1, odd/1, split_accumulator/1, split_filter/1]).

test_even() ->
  true = even(2),
  true = even(0),
  false = even(1),
  ok.

test_odd() ->
  true = odd(3),
  false = odd(2),
  false = odd(0),
  ok.

test_split_accumulator() ->
  {[6, 4, 2], [5, 3, 1]} = split_accumulator([1, 2, 3, 4, 5, 6]),
  {[6, 4, 2], []} = split_accumulator([2, 4, 6]),
  {[], [5, 3, 1]} = split_accumulator([1, 3, 5]),
  {[], []} = split_accumulator([]),
  ok.

test_split_filter() ->
  {[2, 4, 6], [1, 3, 5]} = split_filter([1, 2, 3, 4, 5, 6]),
  {[2, 4, 6], []} = split_filter([2, 4, 6]),
  {[], [1, 3, 5]} = split_filter([1, 3, 5]),
  {[], []} = split_filter([]),
  ok.

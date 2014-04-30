-module(math_functions_tests).
-export([test_even/0, test_odd/0]).
-import(math_functions, [even/1, odd/1]).

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

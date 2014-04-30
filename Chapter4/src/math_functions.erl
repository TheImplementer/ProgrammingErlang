-module(math_functions).
-export([even/1, odd/1]).

even(Number) ->
  case Number rem 2 of
    0 -> true;
    _ -> false
  end.

odd(Number) ->
  case Number rem 2 of
    0 -> false;
    _ -> true
  end.

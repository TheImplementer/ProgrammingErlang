-module(math_functions).
-export([even/1, odd/1, filter/2]).

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

filter(_, []) ->
  [];
filter(F, [H|T]) ->
  case F(H) of
    true -> [H|filter(F, T)];
    false -> filter(F, T)
  end.

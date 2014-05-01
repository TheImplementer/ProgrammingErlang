-module(math_functions).
-export([even/1, odd/1, filter/2, split_accumulator/1, split_filter/1]).

even(Number) ->
  case Number rem 2 of
    0 -> true;
    1 -> false
  end.

odd(Number) ->
  case Number rem 2 of
    0 -> false;
    1 -> true
  end.

filter(_, []) ->
  [];
filter(F, [H | T]) ->
  case F(H) of
    true -> [H | filter(F, T)];
    false -> filter(F, T)
  end.

split_accumulator(L) -> split_helper(L, [], []).

split_helper([], Evens, Odds) ->
  {Evens, Odds};
split_helper([H | T], Evens, Odds) ->
  case even(H) of
    true -> split_helper(T, [H | Evens], Odds);
    false -> split_helper(T, Evens, [H | Odds])
  end.

split_filter(L) -> {filter(fun even/1, L), filter(fun odd/1, L)}.
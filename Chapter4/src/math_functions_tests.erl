-module(math_functions_tests).
-include_lib("eunit/include/eunit.hrl").
-import(math_functions, [even/1, odd/1, split_accumulator/1, split_filter/1]).

even_test_() ->
  [?_assertEqual(true, even(2)),
    ?_assertEqual(true, even(0)),
    ?_assertEqual(false, even(1))].

odd_test_() ->
  [
    ?_assertEqual(true, odd(3)),
    ?_assertEqual(false, odd(2)),
    ?_assertEqual(false, odd(0))].

split_accumulator_test_() ->
  [?_assertMatch({[6, 4, 2], [5, 3, 1]}, split_accumulator([1, 2, 3, 4, 5, 6])),
    ?_assertMatch({[6, 4, 2], []}, split_accumulator([2, 4, 6])),
    ?_assertMatch({[], [5, 3, 1]}, split_accumulator([1, 3, 5])),
    ?_assertMatch({[], []}, split_accumulator([]))].

split_filter_test_() ->
  [?_assertMatch({[2, 4, 6], [1, 3, 5]}, split_filter([1, 2, 3, 4, 5, 6])),
    ?_assertMatch({[2, 4, 6], []}, split_filter([2, 4, 6])),
    ?_assertMatch({[], [1, 3, 5]}, split_filter([1, 3, 5])),
    ?_assertMatch({[], []}, split_filter([]))].

-module(lib_misc_tests).
-export([my_tuple_to_list_test/0]).
-import(lib_misc, [my_tuple_to_list/1]).

my_tuple_to_list_test() ->
  [] = my_tuple_to_list({}),
  [1, 2, 3] = my_tuple_to_list({1, 2, 3}),
  [one, two, three] = my_tuple_to_list({one, two, three}),
  ok.

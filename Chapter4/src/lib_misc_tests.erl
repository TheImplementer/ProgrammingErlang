-module(lib_misc_tests).
-include_lib("eunit/include/eunit.hrl").
-import(lib_misc, [my_tuple_to_list/1]).

my_tuple_to_list_test_() ->
  [?_assertMatch([], my_tuple_to_list({})),
    ?_assertMatch([1, 2, 3], my_tuple_to_list({1, 2, 3})),
    ?_assertMatch([one, two, three], my_tuple_to_list({one, two, three}))].

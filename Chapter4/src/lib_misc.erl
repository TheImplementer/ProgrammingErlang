-module(lib_misc).
-export([my_tuple_to_list/1]).
-import(erlang, [delete_element/2]).


my_tuple_to_list({}) ->
  [];
my_tuple_to_list(Tuple) when is_tuple(Tuple) ->
  [element(1, Tuple) | my_tuple_to_list(delete_element(1, Tuple))].

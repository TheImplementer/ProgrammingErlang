-module(lib_misc).
-export([my_tuple_to_list/1, my_time_function/1, my_date_string/0]).
-import(erlang, [delete_element/2]).

my_tuple_to_list({}) ->
  [];
my_tuple_to_list(Tuple) when is_tuple(Tuple) ->
  [element(1, Tuple) | my_tuple_to_list(delete_element(1, Tuple))].

my_time_function(F) ->
  {_, _, StartingMicro} = now(),
  F(),
  {_, _, EndingMicro} = now(),
  EndingMicro - StartingMicro.

my_date_string() ->
  {Year, Month, Day} = date(),
  {Hours, Minutes, Seconds} = time(),
  io:format("~p/~p/~p ~p:~p:~p~n", [Year, Month, Day, Hours, Minutes, Seconds]).
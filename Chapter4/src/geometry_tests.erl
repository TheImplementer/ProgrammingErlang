-module(geometry_tests).
-import(geometry, [area/1, perimeter/1]).
-include_lib("eunit/include/eunit.hrl").

area_test_() ->
  [?_assertEqual(6, area({rectangle, 2, 3})),
    ?_assertEqual(16, area({square, 4})),
    ?_assertEqual(12.566370614359172, area({circle, 2})),
    ?_assertEqual(10.0, area({right_triangle, 4, 5}))].

perimeter_test_() ->
  [?_assertEqual(10, perimeter({rectangle, 2, 3})),
    ?_assertEqual(16, perimeter({square, 4})),
    ?_assertEqual(12.566370614359172, perimeter({circle, 2})),
    ?_assertEqual(15.403124237432849, perimeter({right_triangle, 4, 5}))].
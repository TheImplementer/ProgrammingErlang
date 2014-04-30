-module(geometry_tests).
-import(geometry, [area/1, perimeter/1]).
-export([test_area/0, test_perimeter/0]).

test_area() ->
  6 = area({rectangle, 2, 3}),
  16 = area({square, 4}),
  12.566370614359172 = area({circle, 2}),
  10.0 = area({right_triangle, 4, 5}),
  ok.

test_perimeter() ->
  10 = perimeter({rectangle, 2, 3}),
  16 = perimeter({square, 4}),
  12.566370614359172 = perimeter({circle, 2}),
  15.403124237432849 = perimeter({right_triangle, 4, 5}),
  ok.
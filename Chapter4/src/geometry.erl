-module(geometry).
-export([area/1, perimeter/1]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> Radius * Radius * math:pi();
area({right_triangle, Base, Height}) -> Base * Height / 2.

perimeter({rectangle, Width, Height}) -> (Width + Height) * 2;
perimeter({square, Side}) -> Side * 4;
perimeter({circle, Radius}) -> 2.0 * Radius * math:pi();
perimeter({right_triangle, Base, Height}) -> Base + Height + math:sqrt(math:pow(Base, 2) + math:pow(Height, 2)).
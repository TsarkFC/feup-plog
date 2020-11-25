:- use_module(library(lists)).

dif_max_2(X, Y) :- X < Y, X >= Y-2.

make_pairs(L, P, [X-Y|Zs]) :-
    select(X, L, L2),
    select(Y, L2, L3),
    G =.. [P, X, Y], G,
    make_pairs(L3, P, Zs).

make_pairs([], _, []).
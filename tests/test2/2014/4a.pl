:- use_module(library(clpfd)).
:- use_module(library(lists)).

table6(L) :-
    L = [A, B, C, D, E, F],
    domain(L, 1, 6),
    all_distinct(L),

    abs(A-B) #= 1,
    abs(C-D) #= 1,
    
    abs(F-E) #\= 1,
    abs(A-E) #\= 1,

    A #= 1,
    Lines = [
        line(A, 1),
        line(B, 1),
        line(C, 1),
        line(D, 1),
        line(E, 1),
        line(F, 1)
    ],
    disjoint1(Lines, [wrap(1, 7)]),
    
    labeling([], L).
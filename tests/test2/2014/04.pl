:- use_module(library(clpfd)).
:- use_module(library(lists)).

% a) constraint2

% b)
% sequence(-L)
sequence(L) :-
    length(L, 6),
    domain(L, 1, 7),
    all_distinct(L),

    setRestrictions(L),
    head(L, First),
    last(L, Last),
    First #< Last,

    labeling([], L).

setRestrictions([_]).
setRestrictions([N1,N2|T]) :-
    abs(N1-N2) #\= 1,
    Res1 #= N1 rem 2,
    Res2 #= N2 rem 2,
    Res1 #\ Res2,
    setRestrictions([N2|T]).

% c)
% sequence(+N, -L)
sequence(N, L) :-
    length(L, N),
    N1 is N+1,
    domain(L, 1, N1),
    all_distinct(L),

    setRestrictions(L),
    head(L, First),
    last(L, Last),
    First #< Last,
    setRestrictions([First, Last]),

    labeling([], L).
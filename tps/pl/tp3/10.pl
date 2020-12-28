/*10.a)*/
ordenada([N]):-
    integer(N).
ordenada([N1, N2]):-
    integer(N1), integer(N2),
    N1 =< N2.

ordenada([N1, N2|T]):-
    integer(N1), integer(N2),
    N1 =< N2,
    ordenada([N2|T]).
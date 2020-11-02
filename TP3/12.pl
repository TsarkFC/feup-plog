permutacao([], _).

permutacao([H|T], L) :-
    [H|T] \= L,
    member(H, L),
    permutacao(T, L).

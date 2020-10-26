/*5.a)*/
membro(X, [X | T]):-!.
membro(X, [H | T]):-
    membro(X, T).

/*5.b)*/
append([], L, L).
append([X|L1],L2,[X|L3]):- append(L1,L2,L3).

membro(X, L):-
    append(_,[X|_],L).

/*5.c)*/
last(L, X):-
    append(_, [X], L).

/*5.d)*/
nth_elem([E|_], 1, E).
nth_elem([_|T], N, X):-
    N > 1,
    N1 is N-1,
    nth_elem(T, N1, X).
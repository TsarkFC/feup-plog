/*9.a)*/
substitui(_, _, [], []).

substitui(X, Y, [X|T], [Y|L]):-
    substitui(X, Y, T, L).

substitui(X, Y, [Z|T], [Z|L]):-
    Z \= X,
    substitui(X, Y, T, L).

/*9.b)*/
elimina_duplicados([], []).

elimina_duplicados([X|T], L):-
    member(X, T),
    elimina_duplicados(T, L).

elimina_duplicados([X|T], [X|L]):-
    \+member(X, T),
    elimina_duplicados(T, L).
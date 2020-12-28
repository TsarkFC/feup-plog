inverter(Lista,InvLista):-
    rev(Lista,[],InvLista).

rev([], L, L).
rev([H | T], S, L) :-
    rev(T, [H | S], L).
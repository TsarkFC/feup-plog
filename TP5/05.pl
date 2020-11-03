unificavel([], _, []).
unificavel([H|T], Termo, L):-
    \+ H=Termo, !,
    unificavel(T, Termo, L).
unificavel([H|T], Termo, [H|L]):-
    unificavel(T, Termo, L).
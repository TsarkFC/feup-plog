permutacao([], []).
permutacao(Lista, [EI|R]):-
    mdelete(EI, Lista, NovaLista),
    permutacao(NovaLista, R).

mdelete(X, [X|R], R).
mdelete(X, [Y|R], [Y|NR]):-
/*TODO*/

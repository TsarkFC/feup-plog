impoe(X, L) :-
    length(Mid, X),
    append(L1, [X|_], L), append(_, [X|Mid], L1).

%langford(+N, -L) (Not complete)
langford(N, L) :-
    N > 0,
    N1 is N-1,
    N2 is N*2,
    length(L, N2),
    impoe(N, L),
    langford(N1, L).
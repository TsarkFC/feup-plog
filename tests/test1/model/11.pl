impoe(X, L) :-
    length(Mid, X),
    append(L1, [X|_], L), append(_, [X|Mid], L1).

impoeTodos(0, _).
impoeTodos(N, L):-
	impoe(N, L),
	N1 is N - 1,
	impoeTodos(N1, L).

langford(N, L):-
	Size is 2 * N,
	length(L, Size),
	impoeTodos(N, L).
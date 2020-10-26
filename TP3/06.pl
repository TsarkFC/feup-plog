/*6.a)*/
append([], L, L).
append([X|L1],L2,[X|L3]):- append(L1,L2,L3).

delete_one(X, L1, L2):-
    append(A, [X|B], L1),
    append(A, B, L2).

/*6.b)*/
delete_all(_, [], []).

delete_all(X, [X|T], L):-
    delete_all(X, T, L).

delete_all(X, [Z|T], [Z|L]):-
    X \= Z,
    delete_all(X, T, L).

/*6.c)*/
delete_all_list([], L1, L1).

delete_all_list([X|T], L1, L2):-
    delete_all(X, L1, L),
    delete_all_list(T, L, L2).
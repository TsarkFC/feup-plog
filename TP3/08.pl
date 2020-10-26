/*8.a)*/
conta([], 0).
conta([H|T], N):-
    conta(T, N1),
    N is N1+1.

/*8.b)*/
conta_elem(_, [], 0).
conta_elem(X, [X|T], N):-
    conta_elem(X, T, N1), 
    N is N1+1.
conta_elem(X, [Z|T], N):-
    X \= Z,
    conta_elem(X, T, N).
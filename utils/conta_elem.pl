conta_elem(_,[],0).
conta_elem(H,[H, T], N):-
    !,
    conta_elem(H, T, N1),
    N is N1+1.
conta_elem(X, [_X|R], N):-
    conta_elem(X,R,N).
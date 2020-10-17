conta([], 0).
conta([H|T], N):-
    conta(T, N1),
    N is N1+1.
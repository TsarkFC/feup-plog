:-use_module(library(clpfd)).

nqueens(N, Cols):-
    length(Cols, N),
    domain(Cols, 1, N),
    constrain(Cols),
    all_distinct(Cols),
    labeling([], Cols).

constrain([]).
constrain([H|T]):-
    verify(H, T, 1),
    constrain(T).

verify(_, [], _).
verify(H, [Next|T], I):-
    noteaten(H, Next, I),
    I1 is I+1, 
    verify(H, T, I1).

noteaten(X, Y, I):-
    X #\= Y,
    X + I #\= Y,
    X - I #\= Y.

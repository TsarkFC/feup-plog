divisivel(X, Y):-
    0 is X mod Y, !.

divisivel(X, Y) :- 
    X > Y + 1,
    divisivel(X, Y + 1).

primo(N):-
    N > 1,
    N2 = 2,
    \+ divisivel(N, N2).
divisivel(X, Y):-
    X mod Y =:= 0, !.

divisivel(X, Y) :- 
    X > Y + 1,
    divisivel(X, Y + 1).

e_primo(N):-
    N > 1,
    N2 = 2,
    \+ divisivel(N, N2).
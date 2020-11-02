f(X, Y):-
    Y is X*X.
duplica(X, Y):-
    Y is 2*X.

/*map(Lista, Transf, L)*/

map([], _, []).

map([C|R], Transfor, [TC|CR]):-
    aplica(Transfor, [C, TC]),
    map(R, Transfor, CR).

aplica(P, LArgs):-
    G = ..[P|LArgs],
    G.
% 4.a) O programa falha quando x==y e x>z.

% 4.b)
max(X, Y, Z, X):- X>=Y, X>=Z, !.
max(X, Y, Z, X):- Y>=Z, !.
max(_, _, Z, Z).
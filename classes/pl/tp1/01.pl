male('Aldo Burrows').
male('Lincoln Burrows').
male('Michael Scofield').
male('LJ Burrows').

female('Christina Rose Scofield').
female('Lisa Rix').
female('Sara Tancredi').
female('Ella Scofield').

parent('Aldo Burrows', 'Lincoln Burrows').
parent('Christina Rose Scofield', 'Lincoln Burrows').
parent('Lincoln Burrows', 'LJ Burrows').
parent('Lisa Rix', 'LJ Burrows').

parent('Aldo Burrows', 'Michael Scofield').
parent('Christina Rose Scofield', 'Michael Scofield').
parent('Michael Scofield', 'Ella Scofield').
parent('Sara Tancredi', 'Ella Scofield').

mother(X, Y) :-
    parent(X, Y),
    female(X).

father(X, Y) :-
    parent(X, Y),
    male(X).

/*
a) father(X, 'Michael Scofield').
   mother(X, 'Michael Scofield').

b) parent('Aldo Burrows', 'X').
*/

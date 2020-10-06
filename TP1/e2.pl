pilot('Lamb').
pilot('Besenyei').
pilot('Chambliss').
pilot('MacLean').
pilot('Mangold').
pilot('Jones').
pilot('Bonhomme').

team('Breitling', 'Lamb').
team('RedBull', 'Besenyei').
team('RedBull', 'Chambliss').
team('Mediterranean Racing Team', 'MacLean').
team('Cobra', 'Mangold').
team('Matador', 'Jones').
team('Matador', 'Bonhomme').

plane('MX2', 'Lamb').
plane('Edge540', 'Besenyei').
plane('Edge540', 'Chambliss').
plane('Edge540', 'MacLean').
plane('Edge540', 'Mangold').
plane('Edge540', 'Jones').
plane('Edge540', 'Bonhomme').

circuit('Istambul').
circuit('Budapest').
circuit('Porto').

winner('Porto', 'Jones').
winner('Budapest', 'Mangold').
winner('Istambul', 'Mangold').

gates(9, 'Istambul').
gates(6, 'Budapest').
gates(5, 'Porto').

teamwin(Team, Race) :-
    winner(Race, X),
    team(Team, X). 

/*
a) winner('Porto', X).
b) teamwin(X, 'Porto').
c) winner(X, Y), winner(Z, Y), X \= Z.
d) gates(X, Y), X > 8.
e) plane(X, Y), X \= 'Edge540'.
*/
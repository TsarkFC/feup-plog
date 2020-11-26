% elemsComuns(+List1, -Common, +List2)
elemsComuns([], [], _).
elemsComuns([H|T], [Hc|Tc], List2) :-
    member(H, List2), !,
    Hc = H, 
    elemsComuns(T, Tc, List2).
elemsComuns([_|T], Common, List2) :-
    elemsComuns(T, Common, List2).

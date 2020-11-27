%allPerfs
allPerfs :-
    \+ findParticpants.

findParticpants :-
    participant(P, _, Act),
    performance(P, List),
    write(P), write(':'), write(Act), write(':'), write(List), nl,
    fail.

:- use_module(library(clpfd)).
:- use_module(library(lists)).

% giving multiple results (?)
% squareTable([A, B, C, D, E, F, G, H], 8, [A-B, C-D, E-F, G-H], [A-C, B-C, A-E, D-G, D-H, E-G, E-H]).
squareTable(People, TableSize, Together, NotTogether) :-
    domain(People, 1, TableSize),
    all_distinct(People),

    People = [First|_], 
    First #= 1,

    length(Lines, TableSize),
    buildLines(People, Lines),
    WrapSize is TableSize + 1,
    disjoint1(Lines, [wrap(1, WrapSize)]),

    TogetherSum is TableSize+2,
    applyTogether(Together, TogetherSum),
    applyNotTogether(NotTogether, TogetherSum),
    
    labeling([], People).

applyTogether([], _).
applyTogether([A-_B|T], TogetherSum) :-
    A == 1,
    applyTogether(T, TogetherSum).
applyTogether([A-B|T], TogetherSum) :-
    A #\= 1,
    A + B #= TogetherSum,
    applyTogether(T, TogetherSum).

applyNotTogether([], _).
applyNotTogether([A-B|T], TogetherSum) :-
    A + B #\= TogetherSum,
    applyNotTogether(T, TogetherSum).

buildLines([], []).
buildLines([People|T], [Line|Lines]) :-
    Line = line(People, 1),
    buildLines(T, Lines).
:-use_module(library(lists)).

abs(Number, Result):-
    Number < 0 -> Result is Number * -1 ; Result = Number.

% distancia(+User1, -Distancia, +User2)
distancia(User1, Distancia, User2) :-
    user(User1, Year1, Country1),
    user(User2, Year2, Country2),
    AgeDiff is abs(Year1 - Year2),
    (
        (Country1 == Country2) -> CountryDiff = 0 ; CountryDiff = 2
    ),
    vote(User1, Films1),
    vote(User2, Films2),
    findall(Diff, (
            member(Film-Rating1, Films1),
            member(Film-Rating2, Films2),
            Diff is abs(Rating1 - Rating2)
            ),
            Diffs),
    sumlist(Diffs, Sum),
    length(Diffs, Count),
    AvgDiff is Sum / Count,
    Distancia is AvgDiff + AgeDiff/3 + CountryDiff.
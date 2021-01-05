:- use_module(library(clpfd)).
:- use_module(library(lists)).

% optimal_skating_pairs(+MenHeights,+WomenHeights,+Delta,-Pairs)
optimal_skating_pairs(MenHeights, WomenHeights, Delta, Pairs) :-
    length(MenHeights, MenLength),
    length(WomenHeights, WomenLength),
    minimum(PairsMaxLength, [MenLength, WomenLength]),

    buildPairs(MenHeights, WomenHeights, Delta, Pairs, 0, Length, PairsMaxLength),
    sortPairs(Pairs),

    maplist(man_value, Pairs, MenPairs),
    all_distinct(MenPairs),

    maplist(woman_value, Pairs, WomenPairs),
    all_distinct(WomenPairs),
    
    append(MenPairs, WomenPairs, All),
    labeling([maximize(Length)], All).

buildPairs(_MenHeights, _WomenHeights, _Delta, [], Length, Length, Length).
buildPairs(MenHeights, WomenHeights, Delta, [P|PairsT], N, Length, MaxLength) :-
    MaxLength #> N,
    element(ManId, MenHeights, ManHeight),
    element(WomanId, WomenHeights, WomanHeight),

    ManHeight #=< WomanHeight + 10,
    ManHeight #>= WomanHeight,

    P = ManId-WomanId,
    N1 is N+1,

    buildPairs(MenHeights, WomenHeights, Delta, PairsT, N1, Length, MaxLength).
buildPairs(_, _, _, [], Length, Length, MaxLength):- MaxLength #> Length.


man_value(M-_W, M).
woman_value(_M-W, W).

sortPairs([_]).
sortPairs([M1-_, M2-W2 | T]) :-
    M1 #< M2,
    sortPairs([M2-W2|T]).
:- use_module(library(clpfd)).
:- use_module(library(lists)).

% gym_pairs([95,78,67,84],[65,83,75,80],10,Pairs).
% gym_pairs(+MenHeights,+WomenHeights,+Delta,-Pairs)
gym_pairs(MenHeights, WomenHeights, Delta, Pairs) :-
    length(MenHeights, Length),
    length(WomenHeights, Length),
    length(Pairs, Length),
    
    buildPairs(MenHeights, WomenHeights, Delta, Pairs),
    sortPairs(Pairs),

    maplist(man_value, Pairs, MenPairs),
    all_distinct(MenPairs),
    
    maplist(woman_value, Pairs, WomenPairs),
    all_distinct(WomenPairs),
    
    append(MenPairs, WomenPairs, All),
    labeling([], All).

buildPairs(_MenHeights, _WomenHeights, _Delta, []).
buildPairs(MenHeights, WomenHeights, Delta, [P|PairsT]) :-
    element(ManId, MenHeights, ManHeight),
    element(WomanId, WomenHeights, WomanHeight),

    ManHeight #=< WomanHeight + 10,
    ManHeight #>= WomanHeight,

    P = ManId-WomanId,

    buildPairs(MenHeights, WomenHeights, Delta, PairsT).

man_value(M-_W, M).
woman_value(_M-W, W).

sortPairs([_]).
sortPairs([M1-_, M2-W2 | T]) :-
    M1 #< M2,
    sortPairs([M2-W2|T]).
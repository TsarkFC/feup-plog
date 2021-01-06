:- use_module(library(clpfd)).

constroi_binarias(I, K, Vars, [LBin|LBins]) :-
    I =< K, !,
    constroi_bins(I, Vars, LBin),
    I1 is I+1,
    constroi_binarias(I1, K, Vars, LBins).
constroi_binarias(_, _, _, []).

constroi_bins(_I, [], []).
constroi_bins(I, [Vars|Vars], [LBinH|LBinT]) :-
    I #= Vars #<=> LBinH,
    constroi_bins(I, Vars, LBinT).
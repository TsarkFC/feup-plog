:- use_module(library(clpfd)).

% distribute(3, [[1,2],[1,3],[2,3],[3],[2,3]], 2, 3, Vars).
% distribute(+NBags, +Domains, +MinObj, +MaxObj, -Vars)
distribute(NBags, Domains, MinObj, MaxObj, Vars) :-
    length(Domains, TotalBags),
    length(Vars, TotalBags),

    setVarsDomains(Vars, Domains),
    setBagsRestriction(Vars, MinObj, MaxObj, 0, NBags),

    labeling([], Vars).


setVarsDomains([], []).
setVarsDomains([Var|Vars], [Domain|Domains]) :-
    list_to_fdset(Domain, FDSet),
    Var in_set FDSet,
    setVarsDomains(Vars, Domains).

setBagsRestriction(_, _, _, NBags, NBags):- !.
setBagsRestriction(Vars, MinObj, MaxObj, N, NBags) :-
    N1 is N+1,
    count(N1, Vars, #=, NObjs),
    (NObjs #= 0 #\/ (NObjs #>= MinObj #/\ NObjs #=< MaxObj)),
    setBagsRestriction(Vars, MinObj, MaxObj, N1, NBags).

:- use_module(library(clpfd)).

% distribute([[1,2],[1,3],[2,3],[3],[2,3]], Vars).
% distribute(+Domains, -Vars)
distribute(Domains, Vars) :-
    length(Domains, Length),
    length(Vars, Length),

    setVarsDomains(Domains, Vars),
    verifyConsecutive(Vars),

    labeling([], Vars).

setVarsDomains([], []).
setVarsDomains([List|T], [Var|Vars]) :-
    list_to_fdset(List, FDSet),
    Var in_set FDSet,
    setVarsDomains(T, Vars).

verifyConsecutive([_]).
verifyConsecutive([Var1, Var2|Vars]) :-
    Var1 #\= Var2,
    verifyConsecutive([Var2|Vars]).
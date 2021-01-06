% Solved usinmg bin packing
% Does not satisfy all constraints


:- use_module(library(clpfd)).
:- use_module(library(lists)).

% prat([[24, 5], [75, 13]], [176-40, 396-24, 474-35, 250-8, 149-5, 479-5], Vars).
% Vars = [3,1,3,4,1,4] ? ;
% Vars = [3,1,3,4,2,4] ? ;
% prat(+Prateleiras, +Objetos(Peso-Volume), -Vars)
prat(Prateleiras, Objetos, Vars) :-
    length(Objetos, Length),
    length(Vars, Length),
    
    transformNestedList(Prateleiras, NotNestedP),
    length(NotNestedP, NumPrateleiras),
    domain(Vars, 1, NumPrateleiras),

    buildItems(Objetos, Items, Vars),
    buildBins(NotNestedP, Bins, 1),

    bin_packing(Items, Bins),

    labeling([], Vars).

transformNestedList([], []).
transformNestedList([H|T], List) :-
    transformNestedList(T, SubList),
    append(H, SubList, List).

buildItems([], [], []).
buildItems([_Peso-Volume|Objs], [Item|Items], [Var|Vars]) :-
    Item = item(Var, Volume),
    buildItems(Objs, Items, Vars).

buildBins([], [], _I).
buildBins([Prateleira|Prateleiras], [Bin|Bins], N) :-
    Bin = bin(N, Prateleira),
    N1 is N+1,
    buildBins(Prateleiras, Bins, N1).
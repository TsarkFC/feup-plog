:- use_module(library(clpfd)).
:- use_module(library(lists)).

% prat([[30, 6], [75, 15]], [176-40, 396-24, 474-35, 250-8, 149-5, 479-5], Vars).
% Vars = [3,1,3,4,1,4] ? ;
% Vars = [3,1,3,4,2,4] ? ;
% prat(+Prateleiras, +Objetos(Peso-Volume), -Vars)
prat(Prateleiras, Objetos, Vars) :-
    length(Objetos, Length),
    length(Vars, Length),

    length(Prateleiras, RowLength),
    transformNestedList(Prateleiras, NotNestedP),

    length(NotNestedP, NumPrateleiras),
    domain(Vars, 1, NumPrateleiras),

    % soma dos elementos de uma divisão
    length(PratSumList, NumPrateleiras),
    buildSums(Vars, Objetos, PratSumList, NumPrateleiras),
    reverse(PratSumList, Reversed),
    Limit is NumPrateleiras - RowLength + 1,
    checkPratSum(Reversed, RowLength, 1, Limit),

    % distribuição dos elementos
    buildTasks(Objetos, Tasks, Vars),
    buildMachines(NotNestedP, Machines, 1),

    cumulatives(Tasks, Machines, [bound(upper)]),

    labeling([], Vars).

transformNestedList([], []).
transformNestedList([H|T], List) :-
    transformNestedList(T, SubList),
    append(H, SubList, List).

buildSums(_, _, [], 0).
buildSums(Vars, Objs, [P|PratSums], N) :-
    pratSum(Vars, Objs, P, N),
    N1 is N-1,
    buildSums(Vars, Objs, PratSums, N1).

pratSum([], [], 0, _N).
pratSum([Var|Vars], [Peso-_Volume|Objs], PratSum, N) :-
    pratSum(Vars, Objs, SubPratSum, N),
    Var #= N #<=> BinaryCheck,
    PratSum #= BinaryCheck * Peso + SubPratSum.

checkPratSum(_, _, Limit, Limit).
checkPratSum(PratSumList, RowLength, N, Limit) :-
    element(N, PratSumList, El1),
    NextN is N + RowLength,
    element(NextN, PratSumList, El2),
    El1 #< El2,
    N1 is N+1,
    checkPratSum(PratSumList, RowLength, N1, Limit).

buildTasks([], [], []).
buildTasks([_Peso-Volume|Objs], [Task|Tasks], [Var|Vars]) :-
    Task = task(0, 1, 1, Volume, Var),
    buildTasks(Objs, Tasks, Vars).

buildMachines([], [], _I).
buildMachines([Prateleira|Prateleiras], [M|Machines], N) :-
    M = machine(N, Prateleira),
    N1 is N+1,
    buildMachines(Prateleiras, Machines, N1).
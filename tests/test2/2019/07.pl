:- use_module(library(clpfd)).
:- use_module(library(lists)).

objeto(piano, 3, 30).
objeto(cadeira, 1, 10).
objeto(cama, 3, 15).
objeto(mesa, 2, 15).
homens(4).
tempo_max(60).

furniture :-
    findall(object(Obj, Men, Time), objeto(Obj, Men, Time), Objects),
    homens(MaxMen),
    tempo_max(MaxTime),

    length(Objects, Length),
    length(StartTimes, Length),
    length(EndTimes, Length),

    domain(StartTimes, 0, MaxTime),
    domain(EndTimes, 0, MaxTime),

    buildTasks(Objects, Tasks, StartTimes, EndTimes, 1),
    cumulative(Tasks, [limit(MaxMen)]),

    append(StartTimes, EndTimes, Times),
    labeling([], Times),

    max_member(EndTime, EndTimes),
    min_member(StartTime, StartTimes),
    TotalTime is EndTime - StartTime,
    print('Total Time: '), print(TotalTime), nl,
    printResult(Objects, StartTimes, EndTimes).

buildTasks([], [], [], [], _Id).
buildTasks([object(_Obj, Men, Time)|Objects], [Task|Tasks], [StartTime|StartTimes], [EndTime|EndTimes], Id) :-
    Task = task(StartTime, Time, EndTime, Men, Id),
    Id1 is Id+1,
    buildTasks(Objects, Tasks, StartTimes, EndTimes, Id1).

printResult([], [], []).
printResult([object(Obj, _Men, _Time)|Objects], [StartTime|StartTimes], [EndTime|EndTimes]) :-
    print(Obj), print(': '), print(StartTime), print('-'), print(EndTime), nl,
    printResult(Objects, StartTimes, EndTimes).
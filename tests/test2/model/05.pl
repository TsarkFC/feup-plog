:- use_module(library(clpfd)).
:- use_module(library(lists)).

% previous exercises were solved on 2017 test

% embrulha([100,45,70], [12,50,14,8,10,90,24], S).
% embrulha(+Rolos,+Presentes,-RolosSelecionados)
embrulha(Rolos, Presentes, RolosSelecionados) :-
    length(Presentes, NPresentes),
    length(RolosSelecionados, NPresentes),

    length(Rolos, NRolos),
    domain(RolosSelecionados, 1, NRolos),

    getTasks(Presentes, RolosSelecionados, Tasks),
    getMachines(1, Rolos, Machines),
    cumulatives(Tasks, Machines, [bound(upper)]),
    labeling([], RolosSelecionados).
    
getTasks([], [], []).
getTasks([P|PresentsT], [R|RsT], [Task|TasksT]) :-
    Task = task(0, 1, 1, P, R),
    getTasks(PresentsT, RsT, TasksT).

getMachines(_N, [], []).
getMachines(N, [R|RolosT], [M|MachinesT]) :-
    M = machine(N, R),
    N1 is N+1,
    getMachines(N1, RolosT, MachinesT).
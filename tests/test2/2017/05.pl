:- use_module(library(clpfd)).
:- use_module(library(lists)).

% cut([12,50,14,8,10,90,24], [100,45,70], S).
% cut(+Shelves, +Boards, -SelectedBoards)
cut(Shelves, Boards, SelectedBoards) :-
    length(Shelves, N),
    length(SelectedBoards, N),

    length(Boards, BoardsSize),
    domain(SelectedBoards, 1, BoardsSize),

    getTasks(Shelves, SelectedBoards, Tasks),
    getMachines(1, Boards, Machines),
    cumulatives(Tasks, Machines, [bound(upper)]),

    labeling([], SelectedBoards).

getTasks([], [], []).
getTasks([S|ShelvesT], [SBoard|SelectedBoardsT], [Task|TasksT]) :-
    Task = task(0, 1, 1, S, SBoard),
    getTasks(ShelvesT, SelectedBoardsT, TasksT).

getMachines(_N, [], []).
getMachines(N, [B|BoardsT], [M|MachinesT]) :-
    M = machine(N, B),
    N1 is N+1,
    getMachines(N1, BoardsT, MachinesT).
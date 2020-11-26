:- consult('11.pl').
:- use_module(library(sets)).
:- set_prolog_flag(toplevel_print_options, [max_depth(0)]).

% podeMoverEmN/3
podeMoverEmN(Pos, N, Celulas) :-
    N > 0,
    reachMove([Pos], [], N, [], CelulasRep),
    sort(CelulasRep, Sorted),
    list_to_set(Sorted, Celulas).

reachMove([Hfrom|Tfrom], New, N, Celulas, Temp) :-
    move(Hfrom, Helper),
    append(Helper, New, New1),
    append(Helper, Celulas, Celulas1),
    reachMove(Tfrom, New1, N, Celulas1, Temp).
reachMove([], New, N, Celulas, Temp) :-
    N > 1, !,
    N1 is N-1,
    reachMove(New, [], N1, Celulas, Temp).
reachMove([], _, _, Celulas, Celulas).
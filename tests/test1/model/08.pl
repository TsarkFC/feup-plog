:- use_module(library(lists)).
:- consult('1.pl').

eligibleOutcome(Id,Perf,TT) :-
    performance(Id,Times),
    madeItThrough(Id),
    participant(Id,_,Perf),
    sumlist(Times,TT).

%nextPhase(+N, -Participants)
nextPhase(N, Participants) :-
    setof(TT-Id-Perf, eligibleOutcome(Id, Perf, TT), Temp),
    length(Temp, TotalN), TotalN >= N,
    reverse(Temp, Temp1),
    editParticipants(Temp1, [], Participants, N).

editParticipants(_, RevParticipants, Participants, 0) :-
    reverse(RevParticipants, Participants).
editParticipants([Ht|Tt], List, Participants, N) :-
    N > 0,
    N1 is N - 1,
    editParticipants(Tt, [Ht|List], Participants, N1).

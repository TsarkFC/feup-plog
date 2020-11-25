%pairableFlights
pairableFlights :-
    \+ helper.

helper :-
    flight(Flight1, _, Id, Time1, Duration, _),
    flight(Flight2, Id, _, Time2, _, _),
    airport(_, Id, _),
    timeDifference(Time1, Duration, Time2),
    write(Id), write(' - '), write(Flight1), write(' \\ '), write(Flight2), nl,
    fail.

timeDifference(Time1, Duration, Time2) :-
    TimeHour1 = Time1 // 100,
    TimeMinutes1 = TimeHour1 * 60 + Time1 mod 100 + Duration,
    TimeHour2 = Time2 // 100,
    TimeMinutes2 = TimeHour2 * 60 + Time2 mod 100,
    Diff is TimeMinutes2 - TimeMinutes1,
    Diff >= 30, Diff =< 90.
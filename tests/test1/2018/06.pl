%tripDays(+Trip, +Time, -FlightTimes, -Days) %Not checking time diferences
tripDays(Trip, Time, FlightTimes, Days) :-
    getFlightTimes(Trip, Time, FlightTimes, Time, 0, Days).

getFlightTimes([_ | []], _, [], _, _, 1).
getFlightTimes([H1, H2|T], Time, [Ht|Tt], LastTime, LastDuration, Days) :-
    airport(_, Id1, H1),
    airport(_, Id2, H2),
    flight(_, Id1, Id2, Ht, Duration, _),
    timeDifference(LastTime, LastDuration, Ht),
    getFlightTimes([H2|T], Time, Tt, Ht, Duration, SubDays),
    (
        LastTime > Ht -> Days is SubDays + 1 ; Days = SubDays
    ).

timeDifference(Time1, Duration, Time2) :-
    TimeHour1 = Time1 // 100,
    TimeMinutes1 = TimeHour1 * 60 + Time1 mod 100 + Duration,
    TimeHour2 = Time2 // 100,
    TimeMinutes2 = TimeHour2 * 60 + Time2 mod 100,
    Diff is TimeMinutes2 - TimeMinutes1,
    (
        Diff >= 30; Diff < 0
    ).
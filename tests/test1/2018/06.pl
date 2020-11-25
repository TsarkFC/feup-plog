%tripDays(+Trip, +Time, -FlightTimes, -Days) %Not checking time diferences
tripDays(Trip, Time, FlightTimes, Days) :-
    getFlightTimes(Trip, Time, FlightTimes, Time, Days),
    verifyFlightTimes(FlightTimes).

getFlightTimes([H | []], _, [], _, 1).
getFlightTimes([H1, H2|T], Time, [Ht|Tt], LastTime, Days) :-
    airport(_, Id1, H1),
    airport(_, Id2, H2),
    flight(Flight1, Id1, Id2, Ht, Duration, _),
    getFlightTimes([H2|T], Time, Tt, Ht, SubDays),
    (
        LastTime > Ht -> Days is SubDays + 1 ; Days = SubDays
    ).
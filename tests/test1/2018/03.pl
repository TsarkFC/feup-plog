%arrivalTime(+Flight, -ArrivalTime)
arrivalTime(Flight, ArrivalTime) :-
    flight(Flight, _, _, DepTime, Dur, _),
    DepHour is DepTime // 100,
    DepMinutes is DepHour * 60 + DepTime mod 100,
    ArrivalMinutes is DepMinutes + Dur,
    ArrivalHour is ArrivalMinutes // 60,
    ArrivalMinute is ArrivalMinutes mod 60,
    ArrivalTime is ArrivalHour*100 + ArrivalMinute.
    
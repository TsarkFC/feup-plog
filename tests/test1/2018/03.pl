%flight(Designation, Origin, Destination, DepartureTime, Duration, Company)
flight('TP1923', 'LPPR', 'LPPT', 1115, 55, 'TAP').
flight('TP1968', 'LPPT', 'LPPR', 2235, 55, 'TAP').
flight('TP842', 'LPPT', 'LIRF', 1450, 195, 'TAP').
flight('TP843', 'LIRF', 'LPPT', 1935, 195, 'TAP').
flight('TP5483', 'LPPR', 'LEMD', 630, 105, 'TAP').
flight('TP5484', 'LEMD', 'LPPR', 1935, 105, 'TAP').
flight('TP1024', 'LFPG', 'LPPT', 940, 155, 'TAP').
flight('TP1025', 'LPPT', 'LFPG', 1310, 155, 'TAP').

%arrivalTime(+Flight, -ArrivalTime)
arrivalTime(Flight, ArrivalTime) :-
    flight(Flight, _, _, DepTime, Dur, _),
    DepHour is DepTime // 100,
    DepMinutes is DepHour * 60 + DepTime mod 100,
    ArrivalMinutes is DepMinutes + Dur,
    ArrivalHour is ArrivalMinutes // 60,
    ArrivalMinute is ArrivalMinutes mod 60,
    ArrivalTime is ArrivalHour*100 + ArrivalMinute.
    
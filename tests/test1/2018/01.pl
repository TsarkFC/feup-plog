%flight(Designation, Origin, Destination, DepartureTime, Duration, Company)
flight('TP1923', 'LPPR', 'LPPT', 1115, 55, 'TAP').
flight('TP1968', 'LPPT', 'LPPR', 2235, 55, 'TAP').
flight('TP842', 'LPPT', 'LIRF', 1450, 195, 'TAP').
flight('TP843', 'LIRF', 'LPPT', 1935, 195, 'TAP').
flight('TP5483', 'LPPR', 'LEMD', 630, 105, 'TAP').
flight('TP5484', 'LEMD', 'LPPR', 1935, 105, 'TAP').
flight('TP1024', 'LFPG', 'LPPT', 940, 155, 'TAP').
flight('TP1025', 'LPPT', 'LFPG', 1310, 155, 'TAP').

%short(+Flight) -> Duration < 90
short(Flight) :-
    flight(Flight, _, _, _, Dur, _),
    Dur < 90.
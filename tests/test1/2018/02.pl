%flight(Designation, Origin, Destination, DepartureTime, Duration, Company)
flight('TP1923', 'LPPR', 'LPPT', 1115, 55, 'TAP').
flight('TP1968', 'LPPT', 'LPPR', 2235, 55, 'TAP').
flight('TP842', 'LPPT', 'LIRF', 1450, 195, 'TAP').
flight('TP843', 'LIRF', 'LPPT', 1935, 195, 'TAP').
flight('TP5483', 'LPPR', 'LEMD', 630, 105, 'TAP').
flight('TP5484', 'LEMD', 'LPPR', 1935, 105, 'TAP').
flight('TP1024', 'LFPG', 'LPPT', 940, 155, 'TAP').
flight('TP1025', 'LPPT', 'LFPG', 1310, 155, 'TAP').

%shorter(+Flight1, +Flight2, -ShorterFlight)
shorter(Flight1, Flight2, ShorterFlight) :-
    flight(Flight1, _, _, _, Dur1, _),
    flight(Flight2, _, _, _, Dur2, _),
    (
        Dur1 < Dur2 -> ShorterFlight = Flight1;
        (
            Dur2 < Dur1 -> ShorterFlight = Flight2;
            false
        )
    ).
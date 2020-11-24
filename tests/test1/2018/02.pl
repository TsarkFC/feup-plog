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
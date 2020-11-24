%short(+Flight) -> Duration < 90
short(Flight) :-
    flight(Flight, _, _, _, Dur, _),
    Dur < 90.
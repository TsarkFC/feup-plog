%curto(+Movie)
curto(Movie) :-
    film(Movie, _, Duration, _),
    Duration < 125.
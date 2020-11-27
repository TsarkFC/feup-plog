%raro(+Movie)
raro(Movie) :-
    film(Movie, _, Duration, _),
    (Duration < 60;
    Duration > 120).
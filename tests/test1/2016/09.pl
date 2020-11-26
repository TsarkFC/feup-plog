:- use_module(library(lists)).

% update(+Film)
update(Film) :-
    retract(film(Film, Categories, Duration, _)), !,
    findall(Rating, (vote(_, List), member(Film-Rating, List)), Ratings),
    sumlist(Ratings, Sum),
    length(Ratings, Count),
    Avg is Sum / Count,
    assert(film(Film, Categories, Duration, Avg)).
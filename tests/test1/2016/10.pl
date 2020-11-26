:- use_module(library(lists)).

avgUserVote(User, Avg):-
    vote(User, FilmRatings), !, % green cut -> does not allow other user verification
    findall(Rating, member(_-Rating, FilmRatings), Ratings),
    length(Ratings, Count),
    sumlist(Ratings, Sum),
    Avg is Sum/Count.
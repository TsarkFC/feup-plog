% niceGuy(+User)
niceGuy(User) :-
    vote(User, List),!,
    member(_-Rating, List),
    Rating >= 8.
% recommends(+User, -Movie)
recommends(User, Movie) :-
    vote(User, List), !,
    vote(User1, List1),
    User1 \= User,
    hasSeenAll(List, List1), !,
    notMember(List1, List, Movie).

hasSeenAll([], _).
hasSeenAll([Film-_|T], List) :-
    member(Film-_, List), !,
    hasSeenAll(T, List).

notMember([], _, _).
notMember([Film-_|T], List, Movie) :-
    (
        (\+ member(Film-_, List)) -> Movie = Film ; notMember(T, List, Movie)
    ).
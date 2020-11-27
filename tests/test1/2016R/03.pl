% likeBetter(+User1, +User2)
likeBetter(User1, User2) :-
    vote(User1, List1),
    vote(User2, List2),
    biggerThanAny2(List1, List2).

biggerThanAny2([], _) :
biggerThanAny2([_-Rating|T], List2) :-
    iterate2(Rating, List2), !,
    biggerThanAny2(T, List2).

iterate2(_, []).
iterate2(Rating, [_-Rating2|T]) :-
    Rating > Rating2, !,
    iterate2(Rating, T).

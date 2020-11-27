% onlyOne(+User1, +User2, -OnlyOneList)
onlyOne(User1, User2, OnlyOneList) :-
    vote(User1, List1),
    vote(User2, List2), !,
    findall(Movie, (member(Movie-_, List1), \+ member(Movie-_, List2)), Movies1),
    findall(Movie, (member(Movie-_, List2), \+ member(Movie-_, List1)), Movies2),
    append(Movies1, Movies2, OnlyOneList).
% happierGuy(+User1, +User2, -HappierGuy)
happierGuy(User1, User2, HappierGuy) :-
    vote(User1, List1),
    sumFilmList(List1, Total1),
    length(List1, L1),
    Avg1 is Total1 / L1,
    vote(User2, List2),
    sumFilmList(List2, Total2),
    length(List2, L2),
    Avg2 is Total2 / L2,
    
    getBigger(User1, Avg1, User2, Avg2, HappierGuy).

sumFilmList([], 0).
sumFilmList([_-Rating|T], Total) :-
    sumFilmList(T, SubTotal),
    Total is Rating + SubTotal.

getBigger(User1, Avg1, _, Avg2, HappierGuy):-
    Avg1 > Avg2,
    HappierGuy = User1.

getBigger(_, Avg1, User2, Avg2, HappierGuy):-
    Avg2 > Avg1,
    HappierGuy = User2.
% printCategory(+Category)
printCategory(Category) :-
    \+ helper(Category).

helper(Category) :-
    film(Film, List, Duration, Classification),
    member(Category, List),
    print(Film), print('('), print(Duration), print('min, '),
    print(Classification), print('/10)'), nl,
    fail.
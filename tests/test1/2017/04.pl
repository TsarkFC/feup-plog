%listGamesOfCategory(+Cat)
listGamesOfCategory(Cat):-
    \+ helper(Cat).

helper(Cat) :-
    game(Game, Categories, Age),
    member(Cat, Categories),
    write(Game), write(' ('), write(Age), write(')'),nl,
    fail.
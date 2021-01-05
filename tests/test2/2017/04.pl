:- use_module(library(clpfd)).
:- use_module(library(lists)).

% sweet_recipes(+MaxTime,+NEggs,+RecipeTimes,+RecipeEggs,-Cookings,-Eggs)
sweet_recipes(MaxTime, NEggs, RecipeTimes, RecipeEggs, Cookings, Eggs) :-
    length(RecipeEggs, RecipeLength),
    length(Plates, RecipeLength),

    domain(Plates, 0, 1),

    count(1, Plates, #=, 3),

    scalar_product(RecipeTimes, Plates, #=<, MaxTime),
    scalar_product(RecipeEggs, Plates, #=, Eggs),
    Eggs #=< NEggs,

    labeling([maximize(Eggs)], Plates),
    findall(N, nth1(N, Plates, 1), Cookings).

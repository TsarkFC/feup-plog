:-use_module(library(lists)).

%averageAge(+Game, -AverageAge)
averageAge(Game, AverageAge) :-
    findall(Age, (player(_, Name, Age), played(Name, Game, _, _)), Ages),
    length(Ages, Num),
    sumlist(Ages, Total),
    AverageAge is Total / Num.
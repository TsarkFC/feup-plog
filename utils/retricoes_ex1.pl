:- use_module(library(clpdf)).

resolve(X, Y):-
    Vars=[X,Y],
    domain(Vars, 1, 99),
    all_distinct(Vars),
    X-3 #= Y+5,
    labeling([], Vars).
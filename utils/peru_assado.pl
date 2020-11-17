:-use_module(library(clpfd)).

% "-67-"
%use: domain/3, #>, rem, labelling/2
peru(X,Z):-
    domain([X,Z], 0, 9),
    X #> 0,
    Preco #= X*1000 + 6*100 + 7*10 + Z,
    Preco rem 72 #= 0,
    labelling([], [X, Z]).
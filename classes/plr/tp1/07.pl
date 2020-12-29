:-use_module(library(clpfd)).

peru_assado(A,B):-
    domain([A,B], 0, 9),
    P #= A*1000 + 670 + B,
    P rem 72 #= 0,
    labeling([], [A,B]).
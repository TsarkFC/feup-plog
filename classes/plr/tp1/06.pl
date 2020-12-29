:-use_module(library(clpfd)).

solution(A,B,C):-
    domain([A,B,C], 1, 1000),
    A*B*C #= A+B+C,
    C #>= B,
    B #>= A,
    labeling([], [A,B,C]).
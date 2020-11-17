:-use_module(library(clpfd)).

hexagono_magico(Vars) :-
    Vars = [A,B,C;D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S],
    domain(Vars, 1, 19),
    all_distinct(Vars),
    Soma = 38,
    A+B+C #= Soma,
    %resto das restições
    labeling([ff], Vars).
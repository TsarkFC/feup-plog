:- use_module(library(clpfd)).
:- use_module(library(lists)).

p2(L1,L2) :-
    length(L1,N),
    length(L2,N),
    %
    pos(L1,L2,Is),
    all_distinct(Is),
    %
    labeling([],Is),
    test(L2).

pos([],_,[]).
pos([X|Xs],L2,[I|Is]) :-
    nth1(I,L2,X),
    pos(Xs,L2,Is).

test([]).
test([_]).
test([_,_]).
test([X1,X2,X3|Xs]) :-
    (X1 < X2, X2 < X3; X1 > X2, X2 > X3),
    test(Xs).

% As variáveis de domínio estão a ser instanciadas antes da fase de pesquisa
% Nem todas as restrições foram colocadas antes da fase de pesquisa
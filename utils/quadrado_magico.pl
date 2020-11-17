:-use_module(library(clpfd)).
:-use_module(library(lists)).

%quadrado NxN
%número entre 1 e NxN
%cada número é único
%soma das linha, colunas e diagonais é igual

magicN(N, Vars) :-
    ground(N),
    N>2,

    %use: sum/3, all_distinct/1, domain
.
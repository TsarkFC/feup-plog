:- use_module(library(lists)).

p1(L1,L2) :-
    gen(L1,L2),
    test(L2).

gen([],[]).
gen(L1,[X|L2]) :-
    select(X,L1,L3),
    gen(L3,L2).

test([]).
test([_]).
test([_,_]).
test([X1,X2,X3|Xs]) :-
    (X1 < X2, X2 < X3; X1 > X2, X2 > X3),
    test(Xs).

% test -> verifica se os elementos de uma lista se econtram ordenados
%         crescente ou decrescentemente 3 a 3
% gen -> verifica se todos os elementos de L2 estão em L1, tendo L2 e L1
%        o mesmo tamanho
:- use_module(library(lists)).
:- use_module(library(between)).

prog1(N,M,L1,L2) :-
    length(L1,N),
    N1 is N-1, length(L2,N1),
    findall(E,between(1,M,E),LE),
    fill(L1,LE,LE_),
    fill(L2,LE_,_),
    check(L1,L2).

fill([],LEf,LEf).
fill([X|Xs],LE,LEf) :-
    select(X,LE,LE_),
    fill(Xs,LE_,LEf).

check([_],[]).
check([A,B|R],[X|Xs]) :-
    A+B =:= X,
    check([B|R],Xs).

% check -> A soma de um elemento da primeira lista com o que se encontra imediatamente
%          a seguir a ele é igual ao elemento que ocupa a mesma posição na segunda lista
%          :- check([1, 2, 3], [3, 5]) é um exemplo que é verificado como verdadeiro

% fill(+L1, +L2, -L3) -> Unifica em L3 todos os elementos de L2 não presentes em L1,
%                        sendo que todos os elementos de L1 estão presentes em L2

% prog1 -> gera duas listas, com comprimento N e com todos os elementos inferirores a M
%          sendo que check é veirificado e ambas as listas não têm elementos em comum

% Pergunta 2 -> M^(2*N-1)
% No pior dos casos executará M^N para a primeira lista
% e M^(N-1) para a segunda, uma vez que tem menos um elemento 
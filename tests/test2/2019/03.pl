% 1: 2**(N*K) -> varáveis binárias

% 2: K**N -> Pessoas (K) é o domínio e Presentes (N) variáveis de domínio

:- use_module(library(clpfd)).

pres(N, K, Vars) :-
    length(Vars, N),
    domain(Vars, 1, K),
    %
    indices(1, Vars).
    %
    %labeling([], Vars).

indices(I, [V|Vs]) :-
    V mod 2 #\= I mod 2,
    I1 is I+1,
    indices(I1, Vs).
indices(_, []).

% 3: Encontra soluções onde a paridade do indíce de cada pessoa (começando por 1)
%    é diferente do valor de paridade do indíce do presente.

% 4: Sim, mas apenas em algumas das variáveis. 
% Ex. K=par, variáveis de índice ímpar => [2, K]
%            variáveis de índice par => [1, K-1]
% Ex. K=ímpar, variáveis de índice ímpar => [2, K-1]
%            variáveis de índice par => [1, K] -> domínio não é alterado
:-use_module(library(clpfd)).

sequencia_magica(Seq, N) :-
    length(Seq, N), %cria lista no N variáveis
    N1 is N-1,
    domain(Seq, 0, N1),
    restringe(N1, Seq, 0),
    labeling([], Seq).

restringe(N, Seq, N).
restringe(N, Seq, I) :-
    element(I, Seq, Xi)
    count(I, Seq, #=, Xi),
    I1 is I + 1,
    restringe(N, Seq, I1).
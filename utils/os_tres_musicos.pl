:-use_module(library(clpfd)).

nome2id('Joao', 1).
nome2id('Antonio', 2).
nome2id('Francisco', 3).
ins2id('Piano', 1).
ins2id('Violino', 2).
ins2id('Harpa', 3).

% use: domain/3, all_distinct, \#

musicos(Sol) :-
    Inst = [Piano, Violino, Harpa],
    domain(Inst, 1, 3),
    all_distinct(Inst),
    nome2id('Antonio', Antonio),
    nome2id('Joao', Joao),
    nome2id('Francisco', Francisco),
    Antonio #\= Piano,
    Joao #\= Violino,
    Joao #\= Piano,
    labeling([], Inst)
    Sol = Inst.
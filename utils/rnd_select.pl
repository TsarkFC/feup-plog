:-use_module(library(random)).
rnd_select(_, 0, []).
rnd_select(List, N, [Sel|LSel]):-
    N>0,
    random_select(Sel, List, List2),
    N1 is N-1, 
    rnd_select(List2, N1, LSel).
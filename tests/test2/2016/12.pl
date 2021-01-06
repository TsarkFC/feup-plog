:- use_module(library(clpfd)).

% ups_and_downs(1, 2, 2, L)
% ups_and_downs(+Min, +Max, +N, -L)
ups_and_downs(Min, Max, N, L) :-
    length(L, N),
    domain(L, Min, Max),
    verify_list(N, L, 1),
    labeling([], L).

verify_list(_ListSize, [_], _N).
verify_list(_ListSize, [A, B], _N) :- A #\= B.
verify_list(ListSize, _List, N) :-
    NComp is N+1,
    ListSize == NComp.
verify_list(ListSize, List, N) :-
    element(N, List, E1),
    N1 is N+1,
    element(N1, List, E2),
    N2 is N1+1,
    element(N2, List, E3),

    ((E1 #> E2 #/\ E2 #< E3) #\/ (E1 #< E2 #/\ E2 #> E3)),

    verify_list(ListSize, List, N1).
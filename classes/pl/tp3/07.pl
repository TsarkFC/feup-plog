append([], L, L).
append([X|L1],L2,[X|L3]):- append(L1,L2,L3).

before(A, B, L):-
    append(_, [A|T], L),
    append(_, [B|_], T).
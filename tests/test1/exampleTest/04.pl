%bestParticipant(+P1, +P2, -P)
bestParticipant(P1, P2, P) :-
    performance(P1, L1),
    performance(P2, L2),
    sumList(L1, R1),
    sumList(L2, R2),
    (
        R1 =:= R2 -> false;
        (
            R1 > R2 -> P is P1;
            (
                P is P2
            )
        ) 
    ).

%sumList(+List, -Result)
sumList([], 0).
sumList([H|T], Result) :-
    sumList(T, SubResult),
    Result is SubResult + H.
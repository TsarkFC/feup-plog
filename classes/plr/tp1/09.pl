:-use_module(library(clpfd)).

zero_zeros(F1, F2):-
    domain([F1,F2], 1, 1000000000),
    F1*F2 #= 1000000000,
    labeling([], [F1,F2]),
    check_zeros(F1),
    check_zeros(F2).

check_zeros(Num):-
    Last is Num rem 10,
    Last #\= 0,
    Num1 is Num // 10,
    Num1 == 0.

check_zeros(Num):-
    Last is Num rem 10,
    Last #\= 0,
    Num1 is Num // 10,
    check_zeros(Num1).
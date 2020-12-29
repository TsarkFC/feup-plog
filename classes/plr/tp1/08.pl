:-use_module(library(clpfd)).

puto_mercearia(Bat,Esp,Atum,Arr):-
    Vars = [Bat,Esp,Atum, Arr],
    domain(Vars, 1, 708),
    Bat+Esp+Atum+Arr #= 711,
    Bat*Esp*Atum*Arr #= 711 * 100 * 100 * 100,
    Bat #> Atum,
    Atum #> Arr,
    minimum(Esp, [Bat,Esp,Atum, Arr]),

    element(I1, Vars, El1),
    El1 rem 10 #= 0,
    element(I2, Vars, El2),
    El2 rem 10 #= 0,
    I1 #\= I2,

    labeling([], Vars).
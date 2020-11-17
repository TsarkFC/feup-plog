:-use_module(library(clpfd)).
:-use_module(library(lists)).

%arroz, batatas, esparguete e atum.
% esparguete < arroz < atum < batatas

compras(Vars):-
    Vars = [Arroz, Batatas, Esparguete, Atum],
    domain(Vars, 1, 710),
    element(I1, Vars, El1),
    El1 rem 10 #= 0,
    element(I2, Vars, El2),
    El2 rem 10 #= 0,
    I1 #\= I2,
    Batatas #> Atum, Atum #> Arroz,
    Arroz + Batatas + Esparguete + Atum #= 711,
    Arroz * Batatas * Esparguete * Atum #= 711 * 100 * 100 * 100,
    minimum(Esparguete, Vars),
    labeling([], Vars).
    

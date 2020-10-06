factorial(0,1).
factorial(N,Valor):-
    N>0,
    N1 is N-1,
    factorial(N1,Valor1),
    Valor is Valor1*N.
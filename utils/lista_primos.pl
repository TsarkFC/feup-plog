lista_primos(0, []).
lista_primos(1, []).

lista_primos(N, [N|R]):-
    primo(N),!,
    N1 is N-1,
    lista_primos(N1, R).
lista_primos(N, [N|R]):-
    N>1,
    N1 is N-1,
    lista_primos(N1, R).
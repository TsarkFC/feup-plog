/*14.a)*/
primo(N):-
    N1 is round(sqrt(N)),
    num_primo(N, N1).

num_primo(_, 1).
num_primo(N, N1):-
    N mod N1 =\= 0,
    N2 is N1-1,
    num_primo(N, N2).

/*14.b)*/
lista_primos(0, []).
lista_primos(N, Lista):-
    build_primos(N, [], Lista).

build_primos(1, L, L).
build_primos(N, L, R) :-
    primo(N),
    N1 is N-1,
    build_primos(N1, [N|L], R).

build_primos(N, L, R) :-
    \+primo(N),
    N1 is N-1,
    build_primos(N1, L, R).
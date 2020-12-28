/*13.a)*/
lista_ate(0, []).

lista_ate(N, L):-
    add_num(N, [], L).


add_num(0, L, L).
add_num(N, L, R):-
    N1 is N-1,
    add_num(N1, [N|L], R).

/*13.b)*/
lista_entre(N, N, []).

lista_entre(N1, N2, L):-
    N is N1-1,
    add_num_interval(N, N2, [], L).

add_num_interval(N, N, L, L).
add_num_interval(N1, N2, L, R):-
    N2 > N1,
    N is N2-1,
    add_num_interval(N1, N, [N2|L], R).

/*13.c)*/
soma_lista([], 0).
soma_lista(L, Soma):-
    soma(L, 0, Soma).

soma([], Soma, Soma).
soma([H|T], Soma, R) :-
    S is Soma + H,
    soma(T, S, R).

/*13.d)*/
par(N):-
    N mod 2 =:= 0.

/*13.e)*/
lista_pares(0, []).

lista_pares(N, Lista) :-
    pares(N, [], Lista).

pares(0, L, L).
pares(N, L, R) :-
    par(N), %change in f)
    N1 is N-2, 
    pares(N1, [N|L], R).

pares(N, L, R) :-
    \+par(N), %change in f)
    N1 is N-1,
    pares(N1, L, R).
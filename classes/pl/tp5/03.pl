dados(um).
dados(dois).
dados(tres).

/*3.a)
cut_teste_a(X), write(X), nl, fail.
um
dois
tres
ultima clausula
no
*/

cut_teste_a(X) :-
    dados(X).
cut_teste_a('ultima clausula').

/*3.b)
cut_teste_b(X), write(X), nl, fail.
um
no
*/

cut_teste_b(X) :-
    dados(X), !.
cut_teste_b('ultima clausula').

/*3.c)
cut_teste_b(X, Y), write(X - Y), nl, fail.
um - um
um - dois
um - tres
no
*/

cut_teste_c(X, Y) :-
    dados(X),
    !,
    dados(Y).
cut_teste_c('ultima clausula').
aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).
frequenta(joao, feup).
frequenta(maria, feup).
frequenta(joel, ist).
professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).
funcionario(pedro, ist).
funcionario(ana_paula, feup).
funcionario(carlos, feup).

colega(X, Y):-
    ((frequenta(X, _Z), frequenta(Y, _Z));
    (aluno(X, _Z), aluno(Y, _Z))),
    X \= Y
.

colega(X, Y):-
    funcionario(X, _Z),
    funcionario(Y, _Z),
    X \= Y
.

/*
    a) aluno(Z, _Y), professor(X, _Y), funcionario(X, _W), frequenta(Z, _W).

    b) funcionario(Y, X); frequenta(Z, X).

    c) colega(X, Y).
*/
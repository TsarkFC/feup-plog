passaro('Tweety').
peixe('Goldie').
minhoca('Molie').
gato('Silvester').

amigo('Eu', 'Silvester').

come(X, Y) :- passaro(X), minhoca(Y).
come(X, Y) :- gato(X), peixe(Y).
come(X, Y) :- gato(X), passaro(Y).

gosta(X, Y) :- amigo(X, Y).

/*
a) come('Silvester', Y).
*/
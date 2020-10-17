comprou(joao, honda).
ano(honda, 1997). 
comprou(joao, uno).
ano(uno, 1998).
valor(honda, 20000).
valor(uno, 7000).

pode_vender(Pessoa, Carro, Ano):-
    comprou(Pessoa, Carro),
    valor(Carro, Valor),
    Valor < 10000,
    ano(Carro, A),
    Ano-A =< 10
.
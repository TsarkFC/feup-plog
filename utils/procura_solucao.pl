%procura_solucao(+EstadoInicial, +EstadoFinal, -Ops)

%1o -> 4litros; 2o -> 3litros; inicialmente vazios; queremos o 1o com 2litros
%Solução: Encher 2o balde; Passar para o 1o; Encher 2o balde; Passar para o 1o até encher; Despejar 1o balde; Passar do 2o para o 1o

%Balde: b(Balde, Capacidade, Quantidade).

%Estado: e(Balde1, Balde2).

%Operações
%-esvazia(+Balde, -NovoBalde, -NomeBalde)
%-enche(+Balde, -NovoBalde, NomeBalde)
%-despeja(+Balde, -NovoBalde, -NomeBalde, -ValorDesp)
% faz_op(+operacao, +Estado, -NovoEstado, -DescrOp)

e(Balde1, Balde2).

esvazia(b(Balde, Capacidade, Quant), b(Balde, Capacidade, 0), Balde):-
    Quant > 0.

enche(b(Balde, Capacidade, Quant), b(Balde, Capacidade, Capacidade), Balde):-
    Quant < Capacidade.

%2 fica cheio
despeja(b(B1, C1, Q1), b(B2, C2, Q2), b(B1, C1, NQ1), b(B2, C2, C2), B1, ValorDesp):-
    Q1>0, Q2<C2, 
    ValorDesp is C2 - Q2,
    NQ1 is Q1 - ValorDesp,
    NQ1 > 0.

%1 fica vazio
despeja(b(B1, C1, Q1), b(B2, C2, Q2), b(B1, C1, 0), b(B2, C2, NQ2), B1, ValorDesp):-
    Q1>0,
    NQ2 > Q1 + Q2,
    NQ2 =< C2.

faz_op(esvazia, e(B1, B2), e(NB1, NB2), esvazia(B)):-
    (esvazia(B1, NB1, B), NB2 = B2 ; esvazia(B2, NB2, B), NB1 = B1).

faz_op(enche, e(B1, B2), e(NB1, NB2), enche(B)):-
    (enche(B1, NB1, B), NB2 = B2 ; NB1 = B1, enche(B2, NB2, B)).

faz_op(despeja, e(B1, B2), e(NB1, NB2), despeja(B, Q)):-
    (despeja(B1, B2, NB1, NB2, B, Q) ; despeja(B2, B1, NB2, NB1, B, Q)).

%Falta procura solução...


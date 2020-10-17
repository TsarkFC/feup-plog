:-use_module(library(lists)).

/*1a versao: tem loops*/
caminho(De, Para, [De, Para]):-
    ligacao(De, Para).

caminho(De, Para, [De|R]):-
    ligacao(De, De2),
    \+ De2 = Para, 
    caminho(De2, Para, R).

/*2a versao: sem loops*/
caminho(De, Para, [De, Para]):-
    caminho4(De, Para, [], Caminho).

caminho4(De, Para, _, [De, Para]):-
    ligacao(De, Para).
caminho4(De, Para, NV, [De|R]):-
    ligacao(De, De2),
    \+ De2 = Para,
    \+ member(De2, NV), %previne ciclos  
    caminho4(De2, Para, [De|NV], R).

/*Predicados importantes: bagof | setof | findall*/
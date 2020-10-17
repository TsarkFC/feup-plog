/*1a versao*/
membro(Elemento, [Elemento|_Tail]). 
membro(Elemento, [_|Tail]):-
    membro(Elemento, Tail).

/*2a versao -> para quando encontra o elemento, mas na funciona com variavel*/
membro(Elemento, [Elemento|_Tail]):-!.
membro(Elemento, [_|Tail]):-
    membro(Elemento, Tail).

/*3a versao -> mais eficiente*/ /*todo*/

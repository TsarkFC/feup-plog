:-use_module(library(lists)).

%move
move(Linha'/'Coluna, Celulas) :-
    Linha1 is Linha + 1,
    Linha2 is Linha + 2,
    Linha3 is Linha - 1,
    Linha4 is Linha - 2,

    Coluna1 is Coluna + 1,
    Coluna2 is Coluna + 2,
    Coluna3 is Coluna - 1,
    Coluna4 is Coluna - 2,

    List = [Linha1'/'Coluna2, Linha1'/'Coluna4,
            Linha2'/'Coluna1, Linha2'/'Coluna3,
            Linha3'/'Coluna2, Linha3'/'Coluna4,
            Linha4'/'Coluna1, Linha4'/'Coluna3],
    
    findall(L'/'C, 
            (
                member(L'/'C, List),
                L >= 1, L =< 8,
                C >= 1, L =< 8
            ), 
            Cel),
    sort(Cel, Celulas).
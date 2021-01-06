:- use_module(library(clpfd)).
:- use_module(library(lists)).

concelho(x, 120, 410).
concelho(y, 10, 800).
concelho(z, 543, 2387).
concelho(w, 3, 38).
concelho(k, 234, 376).

% concelhos(3, 700, CVs, Dist, TE).
% concelhos(+NDias, +MaxDist, -ConcelhosVisitados, -DistTotal, -TotalEleitores)
concelhos(NDias, MaxDist, ConcelhosVisitados, DistTotal, TotalEleitores) :-
    findall(concelho(Nome, Dist, Elei), concelho(Nome, Dist, Elei), Concelhos),
    findall(Dist, concelho(_Nome, Dist, _Elei), Distances),
    findall(Elei, concelho(_Nome, _Dist, Elei), Eleitores),

    length(Concelhos, MaxLength),
    length(Selected, MaxLength),

    domain(Selected, 0, 1),
    count(1, Selected, #=<, NDias),

    scalar_product(Distances, Selected, #=, DistTotal),
    scalar_product(Eleitores, Selected, #=, TotalEleitores),
    DistTotal #=< MaxDist,

    labeling([maximize(TotalEleitores)], Selected),
    findall(Index, nth1(Index, Selected, 1), SelectedIndexes),
    length(SelectedIndexes, NVisitados),
    length(ConcelhosVisitados, NVisitados),
    getVisitados(SelectedIndexes, Concelhos, ConcelhosVisitados).

getVisitados([], _Concelhos, []).
getVisitados([I|Indexes], Concelhos, [NomeVisitado|T]) :-    
    nth1(I, Concelhos, Visitado),
    Visitado =.. L,
    nth1(2, L, Nome),
    NomeVisitado = Nome,
    getVisitados(Indexes, Concelhos, T).
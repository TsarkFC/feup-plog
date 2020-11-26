:- use_module(library(lists)).

% elemsComuns(+List1, -Common, +List2)
elemsComuns([], [], _).
elemsComuns([H|T], [Hc|Tc], List2) :-
    member(H, List2), !,
    Hc = H, 
    elemsComuns(T, Tc, List2).
elemsComuns([_|T], Common, List2) :-
    elemsComuns(T, Common, List2).

% similarity(+Film1, +Film2, -Similarity)
similarity(Film1, Film2, Similarity) :-
    film(Film1, List1, Duration1, Score1),
    film(Film2, List2, Duration2, Score2),
    DurDiffTemp is Duration1 - Duration2,
    (
        (DurDiffTemp < 0) -> DurDiff is DurDiffTemp * -1; DurDiff is DurDiffTemp
    ),
    ScoreDiffTemp is Score1 - Score2,
    (
        (ScoreDiffTemp < 0) -> ScoreDiff is ScoreDiffTemp * -1; ScoreDiff is ScoreDiffTemp
    ),
    getPercentCommonCat(List1, List2, PercentCommonCat),
    Similarity is PercentCommonCat - 3*DurDiff - 5*ScoreDiff.

getPercentCommonCat(List1, List2, PercentCommonCat) :-
    elemsComuns(List1, Common, List2),
    length(Common, CommonNum),
    length(List1, List1Elem),
    length(List2, List2Elem),
    NonCommonNum is List1Elem + List2Elem - CommonNum,
    PercentCommonCat is CommonNum / NonCommonNum * 100.

% mostSimilar(+Film, -Similarity, -Films
mostSimilar(Film, Similarity, Films) :-
    findall(Sim-SecondFilm, (similarity(Film, SecondFilm, Sim), Sim > 10, SecondFilm \= Film), Similarities),
    Similarities = [],
    Films = Similarities,
    Similarity = 0.

mostSimilar(Film, Similarity, List) :-
    findall(Sim-SecondFilm, (similarity(Film, SecondFilm, Sim), Sim > 10, SecondFilm \= Film), Similarities),
    sort(Similarities, Sorted),
    reverse(Sorted, Reversed),
    [Similarity-_|_] = Reversed,
    getSameSimilarity(Similarity, Reversed, List).

getSameSimilarity(Similarity, [SimR-Film|Tr], [H|T]) :-
    SimR == Similarity, !,
    H = Film,
    getSameSimilarity(Similarity, Tr, T).

getSameSimilarity(_, _, []).
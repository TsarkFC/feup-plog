:-use_module(library(lists)).

% areClose(+MaxDist, +Mat, -Pares)
% Mat = [[8], [8,2], [7,4,3], [7,4,3,1]]
areClose(MaxDist, Matrix, Pares) :-
    parseMatrix(MaxDist, Matrix, [], Pares, 2).

parseMatrix(_, [], NotSorted, Pares, _):-
    sort(NotSorted, Pares).
    
parseMatrix(MaxDist, [H|T], Temp, Pares, Y) :-
    parseLine(MaxDist, H, Temp, NewTemp, Y, 1),
    Y1 is Y + 1,
    parseMatrix(MaxDist, T, NewTemp, Pares, Y1).

parseLine(_, [], Temp, Temp, _, _).
parseLine(MaxDist, [H|T], Helper, Temp, Y, X) :-
    X1 is X + 1,
    (
        H =< MaxDist -> parseLine(MaxDist, T, [Y'/'X|Helper], Temp, Y, X1);
        parseLine(MaxDist, T, Helper, Temp, Y, X1)
    ).
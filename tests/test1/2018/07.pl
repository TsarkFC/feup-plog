%avgFlightLengthFromAirport(+Airport, -AvgLength)
:-use_module(library(lists)).

avgFlightLengthFromAirport(Airport, AvgLength) :-
    findall(Length, flight(_, Airport, _, _, Length, _), Lengths),
    length(Lengths, Total),
    sumlist(Lengths, TotalLengths),
    AvgLength is TotalLengths / Total.
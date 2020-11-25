%ageRange(+MinAge, +MaxAge, -Players)
ageRange(MinAge, MaxAge, Players) :-
    findall(Name, (player(Name, _, Age), Age >= MinAge, Age =< MaxAge), Players).
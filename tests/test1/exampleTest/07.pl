%juriFans(juriFansList)
juriFans(JuriFansList) :-
    findall(P-FanList, 
            (performance(P, JuriList), 
                findall(Index, (buildJuriList(JuriList, F), member(juri(Index, Time), F), Time =:= 120), 
                FanList)), 
            JuriFansList).


buildJuriList(JuriList, Formatted) :-
    build(JuriList, Formatted, 1).

build([], [], _).
build([H|T], [Hf|Tf], N) :-
    N1 is N + 1,
    Hf = juri(N, H),
    build(T, Tf, N1).
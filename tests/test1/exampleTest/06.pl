%nSuccessfulParticipants(-T)
nSuccessfulParticipants(T) :-
    findall(Participant, (performance(Participant, List), \+ (member(Time, List), Time =\= 120)), Res),
    length(Res, T).
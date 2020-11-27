%madeItThrough(+Participant)
madeItThrough(Participant) :-
    performance(Participant, List),
    memberchk(120, List).
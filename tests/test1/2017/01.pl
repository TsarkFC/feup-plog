%achievedALot(+Player)
achievedALot(Player) :-
    played(Player, _, _, P),
    P >= 80.
%updatePlayer(+Player, +Game, +Hours, +Percentage)
updatePlayer(Player, Game, Hours, Percentage) :-
    retract(played(Player, Game, PreviousHours, PreviousPercentage)), !,
    NewHours is Hours + PreviousHours,
    NewPercentage is Percentage + PreviousPercentage,
    assert(played(Player, Game, NewHours, NewPercentage)).

updatePlayer(Player, Game, Hours, Percentage) :-
    assert(played(Player, Game, Hours, Percentage)).
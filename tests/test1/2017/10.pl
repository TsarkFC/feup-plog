playedAppropriateGame(Player):-
    player(_, Player, Age), !, %green cut - disallows new search for player in database
    \+ (played(Player, Game, _, _),
        game(Game, _, GameAge),
        GameAge > Age).
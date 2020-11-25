%fewHours(+Player, -Games)
fewHours(Player, Games) :-
    buildPlayedGames(Player, [], Games).

buildPlayedGames(Player, Helper, Games) :-
    played(Player, Game, Hours, _),
    Hours < 10,
    \+ member(Game, Helper), !,
    buildPlayedGames(Player, [Game|Helper], Games).

buildPlayedGames(_, Games, Games).
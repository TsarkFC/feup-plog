%timePlayingGames(+Player, +Games, -ListOfTimes, -SumTimes)
timePlayingGames(_, [], [], 0).
timePlayingGames(Player, [Game|Tg], [Time|Tt], SumTimes) :-
    (
        played(Player, Game, GameTime, _) -> Time = GameTime;
        Time = 0
    ),
    Time = GameTime,
    timePlayingGames(Player, Tg, Tt, SubSumTimes),
    SumTimes is GameTime + SubSumTimes.
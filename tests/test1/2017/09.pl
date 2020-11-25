:-use_module(library(lists)).

%mostEffectivePlayers(+Game, -Players)
mostEffectivePlayers(Game, Players) :-
    findall(Ratio-Player, (played(Player, Game, Hours, Percentage), Ratio is Percentage / Hours), GamePlayers),
    sort(GamePlayers, Sorted),
    reverse(Sorted, Reversed),
    [Max-_|_] = Reversed,
    getAllMax(Max, Reversed, [], Players).

getAllMax(_, [], Temp, Players) :-
    reverse(Temp, Players).
getAllMax(Max, [Ratio-Player|T], Temp, Players) :-
    (
        (Ratio == Max) -> getAllMax(Max, T, [Player|Temp], Players);
        getAllMax(Max, T, Temp, Players)
    ).
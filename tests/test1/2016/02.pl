% diff(+User1, +User2, -Difference, +Film)
diff(User1, User2, Difference, Film) :-
    findVote(User1, Film, Vote1),
    findVote(User2, Film, Vote2),
    Difference is Vote2 - Vote1.

% findVote(+User, +Film, -Vote)
findVote(User, Film, Vote) :-
    vote(User, List),
    member(Film-Vote, List).
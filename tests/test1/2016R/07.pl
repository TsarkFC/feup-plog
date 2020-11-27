:- set_prolog_flag(toplevel_print_options, [max_depth(0)]).

% filmVoting/0
filmVoting(Votings) :-
    findall(Movie-List, 
    (
        film(Movie, _, _, _),
        findall(User-Rating, 
        (
            vote(User, UserList), 
            member(Movie-Rating, UserList)
        ),
        List)
    ), 
    Votings),
    addVotings(Votings).

addVotings([]).
addVotings([Movie-List|T]) :-
    assert(filmUsersVotes(Movie, List)),
    addVotings(T).

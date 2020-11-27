invert(PredicateSymbol, Arity) :-
    functor(Predicate, PredicateSymbol, Arity),
    helper(Predicate, [], List),
    addList(List).

helper(Predicate, Temp, List) :-
    retract(Predicate), !,
    \+ member(Predicate, Temp), !,
    helper(Predicate, [Predicate|Temp], List).

helper(_, List, List).

addList([]).
addList([H|T]) :-
    assert(H),
    addList(T).
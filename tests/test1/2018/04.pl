%countries(+Company, -ListOfCountries)
countries(Company, ListOfCountries) :-
    createList([], ListOfCountries).

operates(Company, Country) :-
    airport(_, Code, Country),
    flight(_, Code, _, _, _, Company).

operates(Company, Country) :-
    airport(_, Code, Country),
    flight(_, _, Code, _, _, Company).

createList(List, ListOfCountries) :-
    airport(_, _, Country),
    operates(Company, Country),
    fail.

find([], _) :- false.
find([H|T], Element) :-
    Element =:= H.
find([H|T], Element) :-
    find(T, Element).
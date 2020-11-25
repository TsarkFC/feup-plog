%countries(+Company, -ListOfCountries)
countries(Company, ListOfCountries) :-
    findCountries(Company, ListOfCountries, []).

findCountries(Company, [Country | ListOfCountries], Seen) :-
    airport(_, _, Country),
    companyOperatesInCountry(Company, Country),
    \+member(Country, Seen), !,
    findCountries(Company, ListOfCountries, [Country | Seen]).
findCountries(_, [], _) :- !.

companyOperatesInCountry(Company, Country) :-
    flight(_, Origin, Dest, _, _, Company),
    airport(_, Origin, OriginCountry),
    airport(_, Dest, DestCountry),
    (
        OriginCountry = Country;
        DestCountry = Country
    ), !.
:- use_module(library(lists)).
:- use_module(library(sets)).

%mostInternational(-ListOfCompanies)
mostInternational(ListOfCompanies) :-
    findall(pair(Num, Company), (company(Company, _, _, _), countriesCount(Company, Num)), List),
    sort(List, Sorted),
    reverse(Sorted, Reversed),
    [pair(Max, _) | _] = Reversed,
    getMostInternational(Reversed, [], ReversedListOfCompanies, Max),
    reverse(ReversedListOfCompanies, ListOfCompanies).
    
getMostInternational([], List, List, _).
getMostInternational([pair(Number, Company)|Tp], Helper, List, Max) :-
    (
        Number == Max -> getMostInternational(Tp, [Company|Helper], List, Max);
        getMostInternational(Tp, Helper, List, Max)
    ).

countriesCount(Company, CountriesNum) :-
    findall(OriginCountry, (flight(_, Origin, _, _, _, Company), airport(_, Origin, OriginCountry)), OriginCountries),
    findall(DestCountry, (flight(_, Dest, _, _, _, Company), airport(_, Dest, DestCountry)), DestCountries),
    append(OriginCountries, DestCountries, Countries),
    list_to_set(Countries, CountriesSet),
    length(CountriesSet, CountriesNum).
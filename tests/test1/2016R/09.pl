% nNumeros/2
nNumeros(List, QuantosSao) :-
    buildList(List, [], Numbers),
    length(Numbers, QuantosSao).

buildList([], Numbers, Numbers).
buildList([Lower-Upper|T], Temp, Numbers) :-
    getNums(Lower, Upper, [], Nums),
    append(Temp, Nums, Temp1),
    buildList(T, Temp1, Numbers).

getNums(Upper, Upper, Temp, Nums) :-
    append(Temp, [Upper], Nums).

getNums(Lower, Upper, Temp, Nums) :-
    Lower < Upper,
    Lower1 is Lower + 1,
    append(Temp, [Lower], Temp1),
    getNums(Lower1, Upper, Temp1, Nums).
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

%itersetam/2
intersetam(NL1, NL2) :-
    buildList(NL1, [], L1),
    buildList(NL2, [], L2),
    findall(Num, (member(Num, L1), member(Num, L2)), Numbers),
    length(Numbers, Length),
    Length > 0.
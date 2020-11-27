%juriTimes(+Participants, +JuriMember, -Times, -Total)
juriTimes([], _, [], 0).
juriTimes([Hp|Tp], JuriMember, [Ht|Tt], Total) :-
    performance(Hp, List),
    getJuriTime(JuriMember, List, Ht),
    juriTimes(Tp, JuriMember, Tt, SubTotal),
    Total is Ht + SubTotal.

%getJuriTime(+JuriMember, +List, -Time)
getJuriTime(1, [H|_], H).
getJuriTime(JuriMember, [_|T], Time) :-
    JuriMember > 1,
    JuriMember1 is JuriMember - 1,
    getJuriTime(JuriMember1, T, Time).
%participant(Id,Age,Performance)
participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').

%performance(Id,Times)
performance(1234,[120,120,120,120]).
performance(3423,[32,120,45,120]).
performance(3788,[110,2,6,43]).
performance(4865,[120,120,110,120]).
performance(8937,[97,101,105,110]).

%getJuriTime(+JuriMember, +List, -Time)
getJuriTime(1, [H|_], H).
getJuriTime(JuriMember, [_|T], Time) :-
    JuriMember > 1,
    JuriMember1 is JuriMember - 1,
    getJuriTime(JuriMember1, T, Time).

%patientJuri(+JuriMember)
patientJuri(JuriMember) :-
    performance(P1, L1),
    performance(P2, L2),
    P1 \= P2,
    getJuriTime(JuriMember, L1, T1),
    getJuriTime(JuriMember, L2, T2),
    T1 =:= 120,
    T2 =:= 120.
    
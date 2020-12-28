:-use_module(library(clpfd)).

% 4.a)  puzzle(3,[0,S,E,N,D],[0,M,O,R,E],[M,O,N,E,Y]).

cripto(Res) :-
    Res = [S,E,N,D,M,O,R,Y],
    domain(Res, 0, 9),
    domain([C1, C2, C3, C4], 0, 1),
    all_different(Res),
    D + E #= Y + C1*10,
    N + R + C1 #= E + C2*10,
    E + O + C2 #= N + C3*10,
    S + M + C3 #= O + C4*10,
    C4 #= M,

    labeling([], Res).
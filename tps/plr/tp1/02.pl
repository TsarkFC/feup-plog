:-use_module(library(clpfd)).

zebra(Zeb, Agu) :-
	Sol = [Cas, Nac, Beb, Ani, Cigs],
    Cas = [Ver, Ama, Azu, Lar, Bra],
    Nac = [Ing, Esp, Nor, Ucr, Por],
    Beb = [Sum, Cha, Caf, Lei, Agu],
    Ani = [Zeb, Cao, Rap, Cav, Igu],
    Cigs = [Mar, Che, Win, Luk, Sgl],

    List = [Ver, Ama, Azu, Lar, Bra, Ing, Esp, Nor, Ucr, Por, Sum, 
            Cha, Caf, Lei, Agu, Zeb, Cao, Rap, Cav, Igu, Mar, Che, Win, Luk, Sgl],

    domain(List, 1, 5),

    Ing #= Ver,
    Esp #= Cao,
    Nor #= 1,
    Ama #= Mar,
    abs(Che-Rap) #= 1,
    abs(Nor-Azu) #= 1,
    Win #= Igu,
    Ucr #= Cha,
    Por #= Sgl,
    abs(Mar-Cav) #= 1,
    Ver #= Caf,
    Ver #= Bra+1,
    Lei #= 3, 

    all_different(Cas),
    all_different(Nac),
    all_different(Beb),
    all_different(Ani),
    all_different(Cigs),

    labeling([], List),
	write(Sol), nl.
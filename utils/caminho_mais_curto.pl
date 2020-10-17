/*base de dados*/
I(porto, gaia, 5, 3).
I(porto, braga, 55, 20).
I(porto, barcelos, 40, 22).
I(braga, barcelos, 10, 4).
I(gaia, coimbra, 70, 30).
I(lisboa, coimbra, 80, 35).
I(porto, coimbra, 75, 25).
ligacao(C1, C2, Dur, Custo):-
    I(C1, C2, Dur, Custo);I(C2, C1, Dur, Custo).


/*solucao ineficiente*/
caminho_mais_curto(D, P, C):-
    todos_caminhos(D, P, Caminhos),
    shortest_list(Caminhos, C).

shortest_list(Ls, SI):-
    shortest_list(Ls, 9999999, SI, Sel), 
    ground(Sel).
%estado_jogo(tabuleiro(...), PecasBrancas, PecasPretas, Jogador).

%tabuleiro(...) -> lista de listas 

tabuleiro(NumLinha, PecasNaLinha, ...).

estado_inicial(estado_jogo(tabuleiro(1/[9, 11, 13, 15, 16, 14, 12, 10],
                                    2/[1, 2, 3, 4, 5, 6, 7, 8],
                                    3/[0, 0, 0, 0, 0, 0, 0, 0],
                                    4/[0, 0, 0, 0, 0, 0, 0, 0],
                                    5/[0, 0, 0, 0, 0, 0, 0, 0],
                                    6/[0, 0, 0, 0, 0, 0, 0, 0],
                                    7/[0, 0, 0, 0, 0, 0, 0, 0],  %ids de peças a completar
                                    8/[0, 0, 0, 0, 0, 0, 0, 0] )))

peca(Cor, Linha, Pos, Tipo).

%acesso estrutura de dados
pecas_do_jogador(b, e(_Tabuleiro, B, _P, _), B).
pecas_do_jogador(p, e(_Tabuleiro, P, _B, _), P).
jogador(e(_T, _B, _P, Jogador), Jogador).
tabuleiro(e(Tabuleiro, _B, _P, _Jogador, Tabuleiro)).

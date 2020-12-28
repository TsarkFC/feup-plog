homem('Joao').
mulher('Maria').
mulher('Ana').

animal('cao').
animal('tigre').
animal('gato').

habitacao('casa').
habitacao('apartamento').

jogo('xadrez').
jogo('damas').

desporto('tenis').
desporto('natacao').

mora_em('Joao', 'apartamento').
mora_em('Maria', 'apartamento').
mora_em('Ana', 'casa').

gosta_de('Joao', 'cao').
gosta_de('Joao', 'tenis').
gosta_de('Maria', 'damas').
gosta_de('Maria', 'natacao').
gosta_de('Maria', 'gato').
gosta_de('Ana', 'tigre').
gosta_de('Ana', 'tenis').

/*
    a) mora_em(X, 'apartamento'), gosta_de(X, _Y), animal(_Y).

    b) mora_em('Joao', 'casa'), mora_em('Maria', 'casa'), gosta_de('Joao', _X), gosta_de('Maria', _Y), desporto(_X), desporto(_Y).

    c) gosta_de(X, _Y), gosta_de(X, _Z), jogo(_Y), desporto(_Z).

    d) mulher(_X), gosta_de(_X, 'tenis'), gosta_de(_X, 'tigres').
*/
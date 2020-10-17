livro('Os Maias').
livro('Cosmos').
livro('O Hobbit').
livro('O Senhor dos Aneis').

autor('Eca de Queiroz', 'Os Maias').
autor('Carl Sagan', 'Cosmos').
autor('J. R. R. Tolkien', 'O Hobbit').
autor('J. R. R. Tolkien', 'O Senhor dos Aneis').

nacionalidade('Eca de Queiroz', 'portugues').
nacionalidade('Carl Sagan', 'norte-americano').
nacionalidade('J. R. R. Tolkien', 'britanico').

tipo('Os Maias', 'romance').
tipo('Cosmos', 'divulgacao-cientifica').
tipo('O Hobbit', 'ficcao').
tipo('O Senhor dos Aneis', '(ficcao)').

/*
    a) autor(X, 'Os Maias').

    b) nacionalidade(X, 'portugues'), autor(X, _Y), tipo(_Y, 'romance').

    c) autor(X, _Y), tipo(_Y, 'ficcao'), autor(X, Z), tipo(Z, _T), _T \= 'ficcao'.
*/
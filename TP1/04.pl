prato('peru').
prato('frango').
prato('salmao').
prato('solha').

bebida('cerveja').
bebida('vinho verde').
bebida('vinho maduro').

gosta('Ana', 'vinho verde').
gosta('Bruno', 'vinho verde').

casado('Ana', 'Bruno').
casado('Barbara', 'Antonio').

combina('vinho verde', 'salmao').
combina('vinho verde', 'solha').

/*
    a) casado('Ana', 'Bruno'), gosta('Ana', 'vinho verde'), gosta('Bruno', 'vinho verde').

    b) bebida(X), combina(X, 'salmao').

    c) prato(X), combina('vinho verde', X).
*/
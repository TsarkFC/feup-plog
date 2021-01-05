cargo(tecnico, rogerio).
cargo(tecnico, ivone).
cargo(engenheiro, daniel).
cargo(engenheiro, isabel).
cargo(engenheiro, oscar). 
cargo(engenheiro, tomas).
cargo(engenheiro, ana).
cargo(supervisor, luis).
cargo(supervisor_chefe, sonia).
cargo(secretaria_exec, laura).
cargo(diretor, santiago).
chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, director).
chefiado_por(secretaria_exec, director).

/*
    a) Quem é o chefe dos técnicos e quem o chefia?

    b) Ivone chefia técnicos?

    c) Existe algum supervisor?

    d) Qual o cargo e nome de quem é chefiado por supervisores ou supervisores chefe.

    e) Qual o cargo que não pertence à carolina e é chefiado pelo diretor. 
*/
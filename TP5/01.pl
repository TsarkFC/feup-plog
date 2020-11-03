%uncomment to test
t(b).
%t(c).
%t(d).
%t(e).
t(f).
t(g).

t(a) :- t(b), t(c), !, t(d), t(e).
t(a) :- t(f), t(g).

/*
if (b && c)
    return d && e;
else
    return f && g
*/
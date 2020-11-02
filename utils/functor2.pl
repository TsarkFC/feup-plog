functor2(Term, F, Arity):-
    Term=..[F|Args],
    length(Args, Arity).

:-use_module(library(lists)).
.
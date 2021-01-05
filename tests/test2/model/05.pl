:- use_module(library(clpfd)).
:- use_module(library(lists)).

% previous exercises were solved on 2017 test

% !!INCOMPLETE!!
% embrulha(+Rolos,+Presentes,-RolosSelecionados)
embrulha(Rolos, Presentes, RolosSelecionados) :-
    length(Presentes, NRolos),
    length(RolosSelecionados, NRolos),

    domain(RolosSelecionados, 1, NRolos).
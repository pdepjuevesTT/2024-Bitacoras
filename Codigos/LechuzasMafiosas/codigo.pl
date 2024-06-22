% Lechuzas de ejemplo: 
lechuza(swi, 10, 60).
lechuza(duo, 25, 55).
lechuza(hedwig, 30, 80).

% Punto 1: 
cuanViolentaEs(Lechuza, Violencia) :- 
    lechuza(Lechuza, Sospechosidad, Nobleza),
    Violencia is 5 * Sospechosidad + 42 / Nobleza.

% Punto 2: 
esVengativa(Lechuza) :-
    cuanViolentaEs(Lechuza, Violencia),
    Violencia > 100. 

% Punto 3:
esMafiosa(Lechuza) :-
    lechuza(Lechuza, _, Nobleza),
    not(buenaGente(Lechuza)).

esMafiosa(Lechuza) :-
    lechuza(Lechuza, Sospechosidad, _),
    Sospechosidad > 75.

buenaGente(Lechuza):-
    lechuza(Lechuza, _, Nobleza),
    not(esVengativa(Lechuza)),
    Nobleza > 50.

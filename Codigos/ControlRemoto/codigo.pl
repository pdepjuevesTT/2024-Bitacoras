/----------------------- Base de conocimientos --------------/

hermano(rodrigo).
hermano(miguel).
hermano(natalia).


/----------------------- Reglas -------------------------/
sePelea(rodrigo, Hermano):-
    hermano(Hermano), 
    Hermano \= natalia,
    Hermano \= rodrigo.

sePelea(natalia, Hermano):-
    sePelea(rodrigo, Hermano).

sePelea(miguel, Hermano):-
    hermano(Hermano),
    not(sePelea(rodrigo, Hermano)).

esMenorQue(rodrigo, Hermano):-
    hermano(Hermano),
    not(sePelea(natalia, Hermano)).

escondioElControl(Hermano1):-
    sePelea(Hermano1, rodrigo),
    hermano(Hermano1),
    not(esMenorQue(Hermano1, rodrigo)).

/*

En este caso, como estamos hablando solo de que a rodrigo le 
escondieron el control remoto, puedo basar el problema entorno
a quien le escondio el control a rodrigo, sin generalizar en 
cuando un hermano esconde cosas al otro, lo cual se podria 
esquematizar en la siguiente funcion: 

leEscondeCosasA(Hermano1, Hermano2):-
    sePelea(Hermano1, Hermano2),
    hermano(Hermano1), hermano(Hermano2)
    not(esMenorQue(Hermano1, Hermano2)).

*/

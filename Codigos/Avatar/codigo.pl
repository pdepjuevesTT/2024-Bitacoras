/********** BASE DE CONOCIMIENTO **********/

maestro(toph, tierra).
maestro(katara, agua).
maestro(zuko, fuego).
maestro(aang,agua).
maestro(aang,fuego).
maestro(aang, tierra).
maestro(Maestro, aire):-creoMovimiento(Maestro, _).
maestro(Maestro, aire):-tieneConexionEspiritual(Maestro).

creoMovimiento(zaheer, volar).
creoMovimiento(aang, patinetaDeAire).
creoMovimiento(tenzin, torbellinoDeAire).


tieneConexionEspiritual(kai).
tieneConexionEspiritual(bumi).
tieneConexionEspiritual(zaheer).
tieneConexionEspiritual(marquitos).

tieneDobleMaestria(Maestro):-
    maestro(Maestro,Elemento1),
    maestro(Maestro,Elemento2),
    Elemento1\=Elemento2.

manejaNoAgua(Maestro):-
    maestro(Maestro,_),
    not(maestro(Maestro,agua)).

compatriotas(Maestro1, Maestro2):-
    maestro(Maestro1,Elemento),
    maestro(Maestro2,Elemento).

/********** CONSULTAS **********/
/*
1-¿Existe algún maestro aire?
    ?- maestro(_,aire).
    true .
2-¿Quiénes son los maestros fuego?
    ?- maestro(Maestro, fuego).
    Maestro = zuko ;
    Maestro = aang.
3-¿Quiénes son los maestros y qué elemento controlan?
    ?- maestro(Maestro, Elemento).
    Maestro = toph,
    Elemento = tierra ;
    Maestro = katara,
    Elemento = agua ;
    Maestro = zuko,
    Elemento = fuego ;
    Maestro = aang,
    Elemento = agua ;
    Maestro = aang,
    Elemento = fuego ;
    Maestro = aang,
    Elemento = tierra ;
    Maestro = zaheer,
    Elemento = aire ;
    Maestro = aang,
    Elemento = aire ;
    Maestro = tenzin,
    Elemento = aire ;
    Maestro = kai,
    Elemento = aire ;
    Maestro = bumi,
    Elemento = aire ;
    Maestro = zaheer,
    Elemento = aire ;
    Maestro = marquitos,
    Elemento = aire.
4-¿Qué elementos sabe controlar Aang?
    ?- maestro(aang, Elementos).
    Elementos = agua ;
    Elementos = fuego ;
    Elementos = tierra ;
    Elementos = aire ;
5-¿Sokka sabe controlar algún elemento?
    ?- maestro(sokka,_).
    false.
*/

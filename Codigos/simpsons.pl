/************************  Punto 1  ***********************/

% progenitor\2 -> Padre/Madre, Hijo
progenitor(homero,bart).
progenitor(homero,lisa).
progenitor(homero,maggie).
progenitor(marge,bart).
progenitor(marge,lisa).
progenitor(marge,maggie).
progenitor(ned,rod).
progenitor(ned,tod).
progenitor(abe,homero).
progenitor(abe,herbert).

%%% Consultas %%%
/*
1-Si Homero es padre de Bart.
    ?- progenitor(homero,bart).
    true.
2-Si Homero es padre de Bort.
    ?- progenitor(homero,bort). 
    false.
3-Si existe un padre para Maggie. (con y sin ejemplos de padre)
    ?- progenitor(_,maggie). 
    true .
    ?- progenitor(Padre,maggie). 
    Padre = homero ;
    Padre = marge.
4-Si existe un padre para Ned.
    ?- progenitor(_,ned).        
    false.
5-Si existe un hijo de Herbert.
    ?- progenitor(herbert,_). 
    false.
6-Si Ned tiene hijos.  (con y sin ejemplos de hijos)
    ?- progenitor(ned,_).     
    true .
    ?- progenitor(ned,Hijo). 
    Hijo = rod ;
    Hijo = tod.
7-Si hay algún padre.
    ?- progenitor(_,_).      
    true .
*/

/************************  Punto 2  ***********************/

%hermano\2 -> Hermano1,Hermano2
hermano(Hermano1,Hermano2):-
    progenitor(Padre,Hermano1),
    progenitor(Padre,Hermano2),
    Hermano1\=Hermano2.

%%% Consulta %%%
/*
?- hermano(bart,lisa). 
true .
*/

/************************  Punto 3  ***********************/

% tio\2 -> Tio,Sobrino
tio(Tio,Sobrino):-
    progenitor(Padre,Sobrino),
    hermano(Tio,Padre).
tio(ned,maggie).

%%% Consulta %%%
/*
?- tio(herbert,bart).  
true .
*/

/************************  Punto 4  ***********************/

criadoPorSiMismo(Hijo):-
    progenitor(_,Hijo),
    not(tieneMasDeUnPadre(Hijo)).
tieneMasDeUnPadre(Hijo):-
    progenitor(Padre1,Hijo),
    progenitor(Padre2,Hijo),
    Padre1\=Padre2.

%%% Consulta %%%
/*
?- criadoPorSiMismo(Hijo). 
Hijo = rod ;
Hijo = tod ;
Hijo = homero ;
Hijo = herbert.
*/

/************************  Punto 5  ***********************/

/* 
Por Principio de Universo Cerrado no es necesario modificar 
la base de conocimientos para determinar que Homero no es
padre de Rod y Tod.
*/

%%% Consulta %%%
/*
?- progenitor(homero,tod).
false.
?- progenitor(homero,rod). 
false.
*/

/************************  Punto 6  ***********************/

quilombero(bart).
quilombero(homero).

deportista(rod).
deportista(tod).
deportista(lisa).

tranqui(Persona):-
    persona(Persona),
    not(quilombero(Persona)),
    not(deportista(Persona)).

persona(Persona):-progenitor(Padre,_).
persona(Persona):-progenitor(_,Hijo).

/************************  Punto 7  ***********************/

fanDelDeporte(Padre):-
    progenitor(Padre,_),
    forall(progenitor(Padre,Hijo),deportista(Hijo)).

noSeBancaHermanos(Hijo):-
    progenitor(_,Hijo),
    not(tranqui(Hijo)),
    forall(hermano(Hermano,Hijo),tranqui(Hermano)).

parejaSoniada(Persona, Pareja):-
    progenitor(Persona,_),
    progenitor(Pareja,_),
    Persona\=Pareja,
    forall(progenitor(Persona,Hijo),progenitor(Pareja,Hijo)).

/*************** BASE DE CONOCIMIENTO ***************/

%consumoDeCafe/2 -> Empleado, Cant
consumoDeCafe(michael, 2).
consumoDeCafe(dwight,5).
consumoDeCafe(angela,1).
consumoDeCafe(jim,2).
consumoDeCafe(kevin,0).
consumoDeCafe(oscar,1).
consumoDeCafe(toby,3).
consumoDeCafe(phyllis,4).
consumoDeCafe(ryan,2).
consumoDeCafe(kelly,3).
consumoDeCafe(andy,3).
consumoDeCafe(stanley,4).
consumoDeCafe(meredith,1).
consumoDeCafe(erin,0).
consumoDeCafe(darryl,0).
consumoDeCafe(pam, 2).

%importancia/2 -> Dundie, Importancia
importancia(mejorJefeDelMundo,100).
importancia(sensei,5).
importancia(jimothy,10).
importancia(mejorPapa,15).
importancia(mejorMama,15).
importancia(masPequenia,10).
importancia(zapatosBlancos,30).
importancia(masAtractivoDeLaOficina,20).
importancia(mejorCoqueteo,10).
importancia(crucigrama,15).
importancia(peorVendedor,5).
importancia(abejaMasOcupada,10).
importancia(compromisoMasLargo,15).

tomaMuchoCafe(Empleado):-
    consumoDeCafe(Empleado, Cantidad),
    Cantidad>10.

%ganoDundie/2 -> Empleado, Dundie
ganoDundie(michael, mejorJefeDelMundo).
ganoDundie(meredith, mejorMama).
ganoDundie(pam, zapatosBlancos ).

empleado(Empleado):-consumoDeCafe(Empleado,_).

nuncaGanoDundie(Empleado):-
    empleado(Empleado),
    not(ganoDundie(Empleado,_)).

ganoMasDeUnaVez(Empleado):-
    ganoDundie(Empleado,Dundie1),
    ganoDundie(Empleado,Dundie2),
    Dundie1\=Dundie2.

ganoUnaSolaVez(Empelado):-
    ganoDundie(Empelado,_).
    not(ganoMasDeUnaVez(Empelado)).

puntaje(Empleado, Dundie, Puntaje):-
    consumoDeCafe(Empleado, CantidadCafe),
    ganoDundie(Empleado,Dundie),
    importancia(Dundie, Importancia),
    Puntaje is CantidadCafe*Importancia.

ganadorSupremo(Empleado):-
    ganoDundie(Empleado,_),
    not(tienePuntajeMayor(_,Empleado)). %no existe nadie que tenga un puntaje mayor que el Empleado

tienePuntajeMayor(EmpleadoMayorPuntaje, EmpleadoMenorPuntaje):-
    puntaje(EmpleadoMayorPuntaje,_,Puntaje1),
    puntaje(EmpleadoMenorPuntaje,_,Puntaje2),
    Puntaje1>Puntaje2.

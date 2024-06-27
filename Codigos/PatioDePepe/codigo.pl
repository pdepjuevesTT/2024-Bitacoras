/********** BASE DE CONOCIMIENTO **********/

planta(petunia).
planta(rosa).
planta(menta).
planta(girasol).

venenoso(petunia).
venenoso(rosa).
venenoso(menta).
venenoso(bromadiolona).
venenoso(arlequin). 

gradoDeVeneno(arlequin, 40).
gradoDeVeneno(bromadiolona, 20).
gradoDeVeneno(Elemento,3):-
    planta(Elemento),
    venenoso(Elemento).

esPlantaComestible(Planta):-
    planta(Planta),
    not(venenoso(Planta)).

esHeavy(Elemento):-
    gradoDeVeneno(Elemento, Grado),
    between(10, 30, Grado).

esIncomible(Elemento):-
    gradoDeVeneno(Elemento, Grado),
    Grado>30.

combinacionIncomible(Elemento1, Elemento2):-
    gradoDeVeneno(Elemento1, Grado1),
    gradoDeVeneno(Elemento2, Grado2),
    21 is Grado1 + Grado2.

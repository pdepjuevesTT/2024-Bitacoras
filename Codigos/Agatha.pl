/******************** BASE DE CONOCIMIENTO ********************/

viveEnLaMansion(agatha).
viveEnLaMansion(charles).
viveEnLaMansion(mayordomo).

% odiaA\2 -> Odiador, Odiado
odiaA(agatha, Odiado):-
    viveEnLaMansion(Odiado),
    Odiado\=mayordomo.
odiaA(charles, Odiado):-
    viveEnLaMansion(Odiado),
    not(odiaA(agatha,Odiado)).
odiaA(mayordomo,Odiado):-
    odiaA(agatha,Odiado).

% esMasRico\2 -> PersonaConMasRiqueza, PersonaConMenosRiqueza
esMasRico(MasRico,agatha):-
    viveEnLaMansion(MasRico),
    not(odiaA(mayordomo, MasRico)).

% mataA\2 -> Asesino, Victima
mataA(Asesino, Victima):-
    odiaA(Asesino,Victima),
    not(esMasRico(Asesino,Victima)).

/************************** CONSULTAS  **************************/
/*
1b)
-¿Quién mató a tía Agatha?
    ?- mataA(Asesino, agatha).
    Asesino = agatha ;
    

2b)
-Si existe alguien que odie a milhouse.
    ?- odiaA(_,milhouse).
    false.

-A quién odia charles.
    ?- odiaA(charles,Odiado).
    Odiado = mayordomo.

-El nombre de quien odia a tía Ágatha.
    ?- odiaA(Odiador,agatha). 
    Odiador = agatha ;
    Odiador = mayordomo.

-Todos los odiadores y sus odiados.
    ?- odiaA(Odiador,Odiado).
    Odiador = agatha, Odiado = agatha ;
    Odiador = agatha, Odiado = charles ;
    Odiador = charles,Odiado = mayordomo ;
    Odiador = mayordomo, Odiado = agatha ;
    Odiador = mayordomo, Odiado = charles ;

-Si es cierto que el mayordomo odia a alguien.
    ?- odiaA(mayordomo,_).
    true .
*/

-- Modelado de los tipos de datos para el Gran Elenco de Actores------------------------

type Pelicula = String

data Persona = UnaPersona {
    nombre :: String,
    recibioOscar :: Bool,
    actuaciones :: [Actuacion]
} deriving (Show)

data Actuacion = UnaActuacion {
    pelicula :: Pelicula,
    valoracion :: Int
} deriving (Show)

-- Funciones auxiliares:

peliculasPremiadas :: [Pelicula]
peliculasPremiadas = ["Titanic", "El Padrino", "El Padrino II", "El Padrino III", "El Padrino IV"]

-- Primera fila ------------------------------------------------------------------------

tieneUnaPelicula :: Persona -> Bool
actuoEnUnaPeliculaDeValoracion persona = tuvoMasDeXValoracion 3 (ultimaActuacion persona) && actuoEnMasDeXPeliculas 1 persona

esUnActorPremiado :: Persona -> Bool
esUnActorPremiado persona = (recibioOscar persona) || esUnaPeliculaPremiada (primeraActuacion persona)

esActorExperimentado :: Int -> Persona -> Bool
esActorExperimentado valor persona = actuoEnMasDeXPeliculas valor persona

-- Funciones auxiliares:

primeraActuacion :: Persona -> Actuacion
primeraActuacion = head . actuaciones

ultimaActuacion :: Persona -> Actuacion
ultimaActuacion = last . actuaciones

actuoEnMasDeXPeliculas :: Int -> Persona -> Bool
actuoEnMasDeXPeliculas valor persona = length (actuaciones persona) > valor

tuvoMasDeXValoracion :: Int -> Actuacion -> Bool
tuvoMasDeXValoracion valor actuacion = valoracion actuacion >= valor

esUnaPeliculaPremiada :: Actuacion -> Bool
esUnaPeliculaPremiada actuacion = (pelicula actuacion) `elem` peliculasPremiadas

-- La academia se rectifica-----------------------------------------------------------

sacarOscar :: Persona -> Persona
sacarOscar persona = persona { recibioOscar = False }

-- Las segundas partes nunca fueron buenas--------------------------------------------

contratarParaSegundaParte :: Persona -> Persona
contratarParaSegundaParte persona
    | tuvoMasDeXValoracion 3 (ultimaActuacion persona) = realizarSegundaParte persona (ultimaActuacion persona)
    | otherwise = persona

-- Funciones auxiliares:

realizarSegundaParte :: Persona -> Actuacion -> Persona
realizarSegundaParte persona actuacion = (agregarActuacion persona . cambiarNombre "II" . cambiarValoracion 2) actuacion

agregarActuacion :: Persona -> Actuacion -> Persona
agregarActuacion persona actuacion  = persona { actuaciones = actuacion : actuaciones persona }

cambiarNombre :: String -> Actuacion -> Actuacion
cambiarNombre nombre actuacion = actuacion { pelicula = nombre ++ nombre}

cambiarValoracion :: Int -> Actuacion -> Actuacion
cambiarValoracion valor actuacion = actuacion { valoracion = (valoracion actuacion) - valor }

-- Villano------------------------------------------------------------------------------

esUnVillano :: Persona -> Bool
esUnVillano persona = todasSusActuacionesTienenMasDeXValoracion 3 persona && actuoEnMasDeXPeliculas 1 persona

-- Funciones auxiliares:

todasSusActuacionesTienenMasDeXValoracion :: Int -> Persona -> Bool
todasSusActuacionesTienenMasDeXValoracion valor persona = all (tuvoMasDeXValoracion valor) (actuaciones persona)

-- Heroes y Heroinas---------------------------------------------------------------------

esHeroeOHeroina :: Persona -> Bool
esHeroeOHeroina persona = (recibioOscar persona) || actuoEnAlgunasPeliculaPremiada (actuaciones persona)

-- Funciones auxiliares:

actuoEnAlgunasPeliculaPremiada :: [Actuacion] -> Bool
actuoEnAlgunasPeliculaPremiada actuaciones = any (esUnaPeliculaPremiada) actuaciones

-- Armando el Gran Elenco-----------------------------------------------------------------

type Actores = [Persona]
type Catalogacion = Persona -> Bool

puedeSerMasDe3Heroes :: Actores -> Bool
puedeSerMasDe3Heroes actores = length (catalogarActores esHeroeOHeroina actores) > 3

puedeHaberMenosDe5Villanos :: Actores -> Bool
puedeHaberMenosDe5Villanos actores = length (catalogarActores esUnVillano actores) < 5

puedeHaber5HeroesOVillanos :: Actores -> Bool
puedeHaber5HeroesOVillanos actores = length (catalogarActores puedeSerHeroeOVillano actores) == 5

-- Funciones auxiliares:

catalogarActores :: Catalogacion -> Actores -> Actores
catalogarActores catalogacion actores = filter catalogacion actores

noEsVillano :: Catalogacion
noEsVillano persona = (not . esUnVillano) persona

puedeSerHeroeOVillano :: Catalogacion
puedeSerHeroeOVillano persona = esHeroeOHeroina persona || esUnVillano persona


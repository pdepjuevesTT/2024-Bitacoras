------------------------------Primer punto------------------------------

type Nombre = String
type Altura = Int

--Modelamos un Jovit usando tuplas
type Jovit = (Nombre, Altura)

bilbo :: Jovit
bilbo = ("Bilbo", 125)

rosita :: Jovit
rosita = ("Rosita", 115)

merryl :: Jovit
merryl = ("Marryl", 131)

pippin :: Jovit
pippin = ("Pippin", 131)

yenny :: Jovit
yenny = ("Yennisifez Lorne", 75)

ary :: Jovit
ary = ("Ariel Airimedez", 103)

------------------------------Segundo punto------------------------------
type Reputacion = Int

reputacion :: Jovit -> Reputacion
reputacion jovit = length (nombre jovit) * altura jovit

altura :: Jovit -> Altura
altura = snd 
--se cancela jovit pero seria equivalente a: altura jovit = snd jovit

nombre :: Jovit -> Nombre
nombre = fst --nombre jovit = fst jovit

{-
si tuviesemos un tercer elemento en la tupla
third (_,_,c)=c
-}

------------------------------Tercer punto------------------------------
diferenciaDeAltura :: Jovit -> Jovit -> Altura
diferenciaDeAltura jovit1 jovit2 = abs (altura jovit1 - altura jovit2)

{-Abriendo la tupla:
diferenciaDeAltura (_, altura1) (_, altura2) = abs (altura1 - altura2) -}

------------------------------Cuarto punto------------------------------

type Censo = [Jovit]

unCenso :: Censo
unCenso = [rosita, merryl, yenny, pippin, ary]

amanecioConElCenso :: Censo -> Jovit
amanecioConElCenso= head --amanecioConElCenso censo = head censo

seCansoDeEsperar :: Censo -> Jovit
seCansoDeEsperar = last --seCansoDeEsperar censo = last censo

type Poblacion = Int
participacion :: Censo -> Poblacion
participacion = length --participacion censo = length censo

elTopTres :: Censo -> [Jovit]
elTopTres = take 3 -- elTopTres censo = take 3 censo

elResto :: Censo -> [Jovit]
elResto = drop 3 --elResto censo = drop 3 censo

------------------------------Quinto punto------------------------------
--Si contunuamos con tuplas: type Jovit2 = (Nombre, Altura,Fuerza,esDeLaCumbancha)
type Fuerza = Int

--No se olviden la mayuscula en el constructor
data Jovit2 = UnJovit {
    nombre' :: Nombre,
    altura' :: Altura,
    fuerza :: Fuerza,
    esDeLaCumbancha :: Bool
} deriving Show --para mostrar por consola

--ejemplo de sitaxis de los jovits
bilbo2 :: Jovit2
bilbo2 = UnJovit "Bilbo" 125 5 True
{-
otra alternativa seria usando el record syntax
bilbo2 = UnJovit{
    nombre'= "bilbo",
    altura'= 125,
    fuerza = 5,
    esDeLaCumbancha = True
}
-}
rosita2 :: Jovit2
rosita2 = UnJovit "Rosita" 115 5 True


type Capacidad = Int
capacidad :: Jovit2-> Capacidad
capacidad jovit
    |esDeLaCumbancha jovit = length (nombre' jovit)*fuerza jovit
    |otherwise = 10 + altura' jovit

------------------------------Sexto punto------------------------------
perderHabla :: Jovit2 -> Jovit2
--perderHabla jovit = UnJovit {nombre'=drop 4 (nombre' jovit), altura'=altura' jovit, fuerza = fuerza jovit, esDeLaCumbancha=esDeLaCumbancha jovit}
perderHabla jovit = jovit {nombre'=drop 4 (nombre' jovit)}

inimputabilizar :: Jovit2 -> Jovit2
inimputabilizar jovit = UnJovit {nombre'= nombre' jovit ++ "Sos inimputable", altura'=altura' jovit +10, fuerza = div (fuerza jovit) 2, esDeLaCumbancha=True}
-- inimputabilizar jovit = jovit {nombre'= nombre' jovit ++ "Sos inimputable", altura'=altura' jovit +10, fuerza = fuerza jovit /2, esDeLaComarca=True}

-- No hay efecto colateral, entonces si nosotros quisieramos "modificar" a bilbo, la funcion solo va a devolver un Jovit nuevo con los valores de Bilbo modificados
bilbito2 ::Jovit2
bilbito2 = inimputabilizar bilbo2

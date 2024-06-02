------------------------------------------------------------------------------------------------
--1) Modelado Estructuras

type Nombre = String
type Durabilidad = Int
type Escudo = Int
type Ataque = Int
type Poder = Nave -> Nave

data Nave = UnaNave {
    nombre :: Nombre,
    durabilidad :: Durabilidad,
    escudo :: Escudo,
    ataque :: Ataque,
    poder :: Poder
}

tieFighter :: Nave
tieFighter = UnaNave "TIE Fighter" 200 100 50 movimientoTurbo

xWing :: Nave
xWing = UnaNave "X Wing" 300 150 100 reparacionEmergencia

naveDeDarthVader :: Nave
naveDeDarthVader = UnaNave "Nave de Darth Vader" 500 300 200 superTurbo

millenniumFalcon :: Nave
millenniumFalcon = UnaNave "Millennium Falcon" 1000 500 50 poderFalcon

--- Poderes
movimientoTurbo :: Poder
movimientoTurbo = efectoEnAtaque 25

reparacionEmergencia :: Poder
reparacionEmergencia = efectoEnDurabilidad 50. efectoEnAtaque (-30)

superTurbo :: Poder
superTurbo = efectoEnDurabilidad (-45) . movimientoTurbo.movimientoTurbo.movimientoTurbo

poderFalcon :: Poder
poderFalcon = reparacionEmergencia.efectoEnEscudos 100

type Efecto = Int
efectoEnAtaque :: Efecto -> Nave -> Nave
efectoEnAtaque efecto nave = nave {ataque = max(ataque nave + efecto) 0}

efectoEnDurabilidad :: Efecto -> Nave -> Nave
efectoEnDurabilidad efecto nave = nave {durabilidad = max(durabilidad nave + efecto) 0}

efectoEnEscudos :: Efecto -> Nave -> Nave
efectoEnEscudos efecto nave = nave {escudo = max(escudo nave + efecto) 0}


-----------------------------------------------------------------------------------------
-- 2) Durabilidad de una Flota

type Flota = [Nave]
type Duracion = Int

durabilidadTotal :: Flota -> Duracion
durabilidadTotal = sum.map durabilidad

------------------------------------------------------------------------------------------
--3) Ataque de naves

naveAtacada :: Atacante -> Atacada -> Atacada
naveAtacada atacante atacada = efectoEnDurabilidad (-danioRecibido (activarPoder atacante)(activarPoder atacada)) atacada

activarPoder :: Nave -> Nave
activarPoder nave = poder nave nave

type Atacante = Nave
type Atacada = Nave
type Danio = Int

danioRecibido :: Atacante -> Atacada -> Danio
danioRecibido atacante atacada
    |escudo atacada > ataque atacante = 0
    |otherwise = ataque atacante - escudo atacada

------------------------------------------------------------------------------------------
--4) Nave fuera de combate 

estaFueraDeCombate :: Nave -> Bool
estaFueraDeCombate = (== 0).durabilidad

-------------------------------------------------------------------------------------------
--5) Misiones

type FlotaEnemiga = [Nave]
type NaveEnemiga = Nave

misionSorpresa :: Nave -> Estrategia-> FlotaEnemiga -> FlotaEnemiga
misionSorpresa nave estrategia = map (atacarSegunEstrategia nave estrategia)

atacarSegunEstrategia :: Nave -> Estrategia -> NaveEnemiga -> NaveEnemiga
atacarSegunEstrategia nave estrategia naveEnemiga
    |estrategia naveEnemiga = naveAtacada nave naveEnemiga
    |otherwise = naveEnemiga

--Estrategias

type Estrategia = Nave -> Bool

naveDebil :: Estrategia
naveDebil = (<200).escudo

type Peligrosidad = Int
naveConPeligrosidad :: Peligrosidad -> Estrategia
naveConPeligrosidad peligrosidad= (>peligrosidad).ataque

naveFueraDeCombate :: Atacante -> Estrategia
naveFueraDeCombate atacante = estaFueraDeCombate. naveAtacada atacante

-------------------------------------------------------------------------------------------
--6) Eleccion de Estrategias

misionMinimizarDurabilidadTotal :: Nave ->  Estrategia -> Estrategia ->FlotaEnemiga -> FlotaEnemiga
misionMinimizarDurabilidadTotal nave estrategia1 estrategia2 flotaEnemiga  = misionSorpresa nave (mejorEstrategia nave flotaEnemiga estrategia1 estrategia2 ) flotaEnemiga

mejorEstrategia :: Nave -> FlotaEnemiga -> Estrategia -> Estrategia -> Estrategia
mejorEstrategia nave flotaEnemiga estrategia1 estrategia2
    |durabilidadTotalFlotaAtacada nave estrategia1 flotaEnemiga < durabilidadTotalFlotaAtacada nave estrategia2 flotaEnemiga = estrategia1
    |otherwise = estrategia2

durabilidadTotalFlotaAtacada :: Nave -> Estrategia -> FlotaEnemiga -> Duracion
durabilidadTotalFlotaAtacada nave estrategia = durabilidadTotal. misionSorpresa nave estrategia

-------------------------------------------------------------------------------------------
--7) Galaxia Infinita

flotaInfinita :: [Nave]
flotaInfinita = repeat xWing

{-
--No existe ninguna forma de determinar la durabilidad porque para hacerlo hay que evaluar todas las naves de la lista, aún teniendo lazy evaluation, esto no es posible.
--Al llevar una mision sobre una flota infinita, se obtiene una lista infinita de flotas atacadas ya que se aplica a todas (y por lo tanto infinitamente) el ataque
-}

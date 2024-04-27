------------------------------------- Punto 1 -------------------------------------
type HorasDeEntrenamiento = Int
type Objetivo = String
type Presion = Int

presionGolpe :: HorasDeEntrenamiento -> Objetivo -> Presion
presionGolpe horasDeEntrenamiento objetivo = poderGolpe horasDeEntrenamiento `div` fortalezaObjetivo objetivo

type Poder = Int
poderGolpe :: HorasDeEntrenamiento -> Poder
poderGolpe = (*15) -- aplicacion parcial de la funcion *

type Fortaleza = Int
fortalezaObjetivo :: Objetivo -> Fortaleza
fortalezaObjetivo = (*2).length -- composicion

------------------------------------- Punto 2 -------------------------------------

gomuGomuElephantGatling :: Objetivo -> Presion
gomuGomuElephantGatling = presionGolpe 180 -- aplicacion parcial de la funcion presionGolpe

golpesNormalesConsecutivos :: Objetivo -> Presion
golpesNormalesConsecutivos = presionGolpe 240

------------------------------------- Punto 3 -------------------------------------
esDificil :: Objetivo -> Bool
esDificil = (<100).gomuGomuElephantGatling

esAccesible :: Objetivo -> Bool
esAccesible = (between 200 400).golpesNormalesConsecutivos.focalizar

focalizar :: Objetivo -> Objetivo
focalizar = take 7

between :: Int -> Int -> Int -> Bool
between menor mayor nro = nro > menor && nro < mayor

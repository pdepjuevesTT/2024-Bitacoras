type Cargo = String
type Antiguedad = Int
type Horas = Float
type Sueldo = Float

sueldo :: Cargo -> Antiguedad -> Horas -> Sueldo
sueldo cargo antig horas = base cargo * porcAntig antig * proporcionalidad horas

base :: Cargo -> Float
base "titular" = 149000
base "adjunto" = 116000
base "ayudante" = 66000
base _ = 0

porcAntig :: Antiguedad -> Float
porcAntig antig | antig < 3 = 1
    | antig < 5 = 1.2
    | antig < 10 = 1.3
    | antig < 24 = 1.5
    | otherwise = 2.2

proporcionalidad :: Horas -> Float
proporcionalidad horas = fromIntegral (round (horas/10))

----------------------------------- Punto 1 -----------------------------------
type Antigüedad = Number
type Grado = Number
type Clan = String

data Hechicero = UnHechicero {
    añosAntigüedad :: Antigüedad,
    grado :: Grado,
    clan :: Clan
}deriving Show

nobara :: Hechicero
nobara = UnHechicero 1 3 "Kugisaki"
satoru :: Hechicero
satoru = UnHechicero 15 0 "Gojo"
maki :: Hechicero
maki = UnHechicero 3 4 "Zenin"
yuji :: Hechicero
yuji = UnHechicero 0 1 "Itadori"

----------------------------------- Punto 2 -----------------------------------

tieneExperiencia :: Hechicero -> Bool
tieneExperiencia hechicero = añosAntigüedad hechicero > 1

----------------------------------- Punto 3 -----------------------------------

type Equipo = [Hechicero]

equipoPreparado :: Equipo -> Bool
equipoPreparado equipo = cantidadIntegrantes equipo > 3

type Cantidad = Number
cantidadIntegrantes :: Equipo -> Cantidad
cantidadIntegrantes = length

----------------------------------- Punto 4 -----------------------------------

subirGrado :: Hechicero -> Hechicero
subirGrado hechicero
    |gradoEspecial hechicero = hechicero
    |otherwise = hechicero {grado = grado hechicero -1}

gradoEspecial :: Hechicero -> Bool
gradoEspecial hechicero = grado hechicero == 0

----------------------------------- Punto 5 -----------------------------------

clanesPrestigiosos :: [Clan]
clanesPrestigiosos = ["Zenin", "Gojo","Kamo"]

esPrestigioso :: Hechicero -> Bool
esPrestigioso hechicero = elem (clan hechicero) clanesPrestigiosos

----------------------------------- Punto 6 -----------------------------------

invencible :: Equipo -> Bool
invencible equipo = any gradoEspecial equipo

----------------------------------- Punto 7 -----------------------------------

favorito :: Equipo -> Bool
favorito equipo = all esPrestigioso equipo

----------------------------------- Punto 8 -----------------------------------
type Expertos = [Hechicero]

expertos :: Equipo -> Expertos
expertos equipo = filter tieneExperiencia equipo

----------------------------------- Punto 9 -----------------------------------

capazDeHacerleFrenteACualquierMaldicion :: Equipo -> Bool
capazDeHacerleFrenteACualquierMaldicion equipo = invencible equipo || equipoPreparado equipo

powerUP :: Equipo -> Equipo
powerUP equipo = map subirGrado equipo

----------------------------------- Punto 10 -----------------------------------

-- recibe como condicion la funcion que calcula el nivel del hechicero => es de orden superior
elMasApto :: Ord a => (Hechicero -> a) -> Hechicero -> Hechicero -> Hechicero 
elMasApto nivel hechicero1 hechicero2
    |nivel hechicero1 > nivel hechicero2 = hechicero1
    |otherwise = hechicero2


type Nivel = Number

nivelTryhard :: Hechicero -> Nivel
nivelTryhard hechicero = 1/ (grado hechicero + 1)

nivelBurogratico :: Hechicero -> Nivel
nivelBurogratico hechicero = length (clan hechicero)

nivelIntimidante :: Hechicero -> Char
nivelIntimidante hechicero = maximum (clan hechicero)

nivelSigilo :: Hechicero -> Nivel
nivelSigilo hechicero = 6 * añosAntigüedad hechicero

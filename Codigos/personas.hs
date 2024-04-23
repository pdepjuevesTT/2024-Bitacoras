data Persona = Alguien{
    edad::Int,
    vivo::Bool,
    apellido::String }

type Calificacion = Int

data Materia = UnaMateria {
    nombre:: String,
    nota1 :: Calificacion,
    nota2:: Calificacion
 --   unDatoCualquiera::Int
} deriving (Show,Eq)

doble valor =  valor * 2

promedio :: Materia -> Calificacion
promedio materia  = div (nota1 materia + nota2 materia) 2

aprobo' :: String -> Int -> Int -> Bool
aprobo' nombre nota1 nota2 = nota1 >= 6 && nota2 >= 6

aprobo:: Materia -> Bool
aprobo  (UnaMateria _ calificacionDelPrimerParcial calificacionDelSegundoParcial )  = calificacionDelPrimerParcial >=6 && calificacionDelSegundoParcial >= 6 

leGusta :: Materia -> Bool
leGusta materia = aprobo materia && nombre materia == "Paradigmas" 

--materialeFueMejor materia1 materia2 = promedio materia1

rendirBienExamen :: String -> Materia
rendirBienExamen nombre = UnaMateria nombre 10 10


sumaMucho :: [Int] -> Bool
sumaMucho lista = sum lista > 100

empiezaCon::Char -> [Char] -> Bool
empiezaCon letra palabra = head palabra == letra

enLaUltimaLeFueMejorQueEnLaPrimera :: [Materia] -> Bool
enLaUltimaLeFueMejorQueEnLaPrimera materias = promedio (last materias) > promedio(head materias)
----------------------------------------------------------------------------------

-- ! ALIAS DE TIPOS

type Titulo = String
type Autor = String
type CantidadDePaginas = Int

----------------------------------------------------------------------------------

-- ! Data + Record Syntax

data Libro = UnLibro {
  titulo :: Titulo,
  autor :: Autor,
  cantidadDePaginas :: CantidadDePaginas
} deriving (Eq, Show)

----------------------------------------------------------------------------------

-- ! DEFINICIONES DE LOS LIBROS 

elVisitante :: Libro
elVisitante = UnLibro "El Visitante" "Stephen King" 592

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = UnLibro "Shingeki no Kyojin 1" "Hajime Isayama" 40

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = UnLibro "Shingeki no Kyojin 3" "Hajime Isayama" 40

shingekiNoKyojin27 :: Libro
shingekiNoKyojin27 = UnLibro "Shingeki no Kyojin 27" "Hajime Isayama" 40

fundacion :: Libro
fundacion = UnLibro "Fundacion" "Isaac Asimov" 230

sandman5 :: Libro
sandman5 = UnLibro "sandman5" "Neil Gaiman" 35

sandman10 :: Libro
sandman10 = UnLibro "sandman10" "Neil Gaiman" 35

sandman12 :: Libro
sandman12 = UnLibro "sandman12" "Neil Gaiman" 35

eragon :: Libro
eragon = UnLibro "eragon" "Christopher Paolini" 544

eldest :: Libro
eldest = UnLibro "eldest" "Christopher Paolini" 704

brisignr :: Libro
brisignr = UnLibro "brisignr" "Christopher Paolini" 700

legado :: Libro
legado = UnLibro "legado" "Christopher Paolini" 811

type Biblioteca = [Libro]

miBiblioteca :: Biblioteca
miBiblioteca = [elVisitante, shingekiNoKyojin1, shingekiNoKyojin3, shingekiNoKyojin27, fundacion, sandman5, sandman10, sandman12, eragon, eldest, brisignr, legado]

----------------------------------------------------------------------------------
-- PUNTO 1: PROMEDIO DE HOJAS

-- FORMA 1: UTILIZANDO LA SALIDA DE UNA FUNCION COMO PARAMETRO
promedioDePaginas :: Biblioteca -> Int
promedioDePaginas unaBiblioteca = div (cantidadDePaginasTotales unaBiblioteca) (length unaBiblioteca)


cantidadDePaginasTotales :: Biblioteca -> Int
cantidadDePaginasTotales unaBiblioteca = sum (map cantidadDePaginas unaBiblioteca)

-- FORMA 2: UTILIZANDO COMPOSICION DE FUNCIONES
cantidadDePaginasTotalesV2 :: Biblioteca -> Int
cantidadDePaginasTotalesV2 unaBiblioteca = (sum . map cantidadDePaginas) unaBiblioteca

-- FORMA 3: UTILIZANDO EL OPERADOR DE APLICACION [ $ ]
cantidadDePaginasTotalesV3 :: Biblioteca -> Int
cantidadDePaginasTotalesV3 unaBiblioteca = sum . map cantidadDePaginas $ unaBiblioteca

----------------------------------------------------------------------------------
-- PUNTO 2: QUE LIBROS SON DE LECTURA OBLIGATORIA

esLecturaObligatoria :: Libro -> Bool
esLecturaObligatoria unLibro = esDeStephenKing unLibro || perteneceASagaEragon unLibro || esFundacion unLibro

-- VARIANTE USANDO PATTERN MATCHING
esLecturaObligatoriaV2 :: Libro -> Bool
esLecturaObligatoriaV2 (UnLibro _ "Stephen King" _) = True
esLecturaObligatoriaV2 (UnLibro "Fundacion" "Isaac Asimov" 230) = True
esLecturaObligatoriaV2 unLibro = perteneceASagaEragon unLibro

-- FORMA 1: COMO LO VENIAMOS HACIENDO
esDeStephenKing :: Libro -> Bool
esDeStephenKing unLibro = (autor unLibro) == "Stephen King"

-- FORMA 2: COMO LO HACEMOS AHORA CON EL CONCEPTO DE COMPOSICION DE FUNCIONES DESBLOQUEADO
esDeStephenKingV2 :: Libro -> Bool
esDeStephenKingV2 unLibro = ((== "Stephen King") . autor) unLibro

esFundacion :: Libro -> Bool
esFundacion unLibro = unLibro == fundacion

perteneceASagaEragon :: Libro -> Bool
perteneceASagaEragon unLibro = elem unLibro sagaDeEragon -- -> unLibro `elem` sagaDeEragon

type Saga = [Libro]
sagaDeEragon :: Saga
sagaDeEragon = [eragon, eldest, brisignr, legado]

----------------------------------------------------------------------------------
-- PUNTO 3: SABER SI UNA BIBLIOTECA ES FANTASIOSA

esFantasiosa :: Biblioteca -> Bool
esFantasiosa unaBiblioteca = any esLibroFantasioso unaBiblioteca

esLibroFantasioso :: Libro -> Bool
esLibroFantasioso unLibro = esDe "Christopher Paolini" unLibro || esDe "Neil Gaiman" unLibro

esDe :: Autor -> Libro -> Bool
esDe unAutor unLibro = ((== unAutor) . autor) unLibro

-- COMO SIEMPRE TENEMOS PRESENTE EL CONCEPTO DE LA EXPRESIVIDAD, TENEMOS EL EJEMPLO DE QUE
-- SIEMPRE SE PUEDE SER UN POQUITO MAS EXPRESIVO...

esLibroFantasiosoV2 :: Libro -> Bool
esLibroFantasiosoV2 unLibro = "Christopher Paolini" `esAutorDe` unLibro || "Neil Gaiman" `esAutorDe` unLibro

esAutorDe :: Autor -> Libro -> Bool
esAutorDe unAutor unLibro = (autor unLibro) == unAutor

----------------------------------------------------------------------------------
-- PUNTO 4: OBTENER EL NOMBRE DE LA BIBLIOTECA

nombreDeLaBiblioteca :: Biblioteca -> String
nombreDeLaBiblioteca unaBiblioteca = sinVocales . concatenarNombresDeLibros $ unaBiblioteca

concatenarNombresDeLibros :: Biblioteca -> String
concatenarNombresDeLibros unaBiblioteca = concatMap titulo unaBiblioteca

sinVocales :: String -> String
sinVocales unString = filter (not . esVocal) unString

esVocal :: Char -> Bool
esVocal unCaracter = elem unCaracter "aeiouáéíóúAEIOUÁÉÍÓÚ"

{-
METODOLOGIA TOP-DOWN:
    CONSISTE EN EVALUAR UN PROBLEMA DESDE LO MAS GENERAL A LO PARTICULAR.
        PARA ESTO DELEGAMOS LAS TAREAS QUE COMPONEN UNA GRAN FUNCION EN DIFERENTES FUNCIONES "AUXILIARES", 
            DONDE CADA UNA TIENE SU TAREA ESPECIFICA.

COMO EJEMPLO DE ESTO TENEMOS:
-}
nombreDeLaBibliotecaV2 :: Biblioteca -> String
nombreDeLaBibliotecaV2 unaBiblioteca = quitarVocales . concatenarNombresDeLibros $ unaBiblioteca

--concatenarNombresDeLibros :: Biblioteca -> String
--concatenarNombresDeLibros unaBiblioteca = concatMap titulo unaBiblioteca

quitarVocales :: String -> String
quitarVocales unTexto = filter noEsVocal unTexto

noEsVocal :: Char -> Bool
noEsVocal unaLetra = not (esVocal' unaLetra)

esVocal' :: Char -> Bool
esVocal' unaLetra = elem unaLetra vocales

vocales :: [Char]
vocales = "aeiouAEIOUáéíóúÁÉÍÓÚ"

----------------------------------------------------------------------------------
-- PUNTO 5: SABER SI UNA BIBLIOTECA ES LIGERA

esBibliotecaLigera :: Biblioteca -> Bool
esBibliotecaLigera unaBiblioteca = all esLecturaLigera unaBiblioteca

esLecturaLigera :: Libro -> Bool
esLecturaLigera unLibro = ((<= 40) . cantidadDePaginas) unLibro

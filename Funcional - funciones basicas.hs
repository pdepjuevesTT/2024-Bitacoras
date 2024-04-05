promedio3:: Float-> Float -> Float -> Float
promedio3 valor1 valor2 valor3 = 
    (valor1 + valor2 + valor3) / 3

saludo :: String -> String
saludo x = "hola " ++ x

buenPromedioAlumnoPdeP:: Float -> Float -> Float -> Bool
buenPromedioAlumnoPdeP n1 n2 n3 = promedio3 n1 n2 n3 >= 7

esVocal:: Char -> Bool
esVocal 'e' = True
esVocal 'a' = True
esVocal 'i' = True
esVocal 'u' = True
esVocal 'o' = True
esVocal x = False

-- PARA HACER
-- 1) si es bisiesto un año

esBisiesto:: Int -> Bool
esBisiesto anio = esDivisible anio 4 && not (esDivisible anio 100) || esDivisible anio 400

esDivisible:: Int -> Int -> Bool
esDivisible dividendo divisor = mod dividendo divisor == 0

-- 2) si es capicua una palabra
esCapicua :: String -> Bool
esCapicua palabra = reverse palabra == palabra

-- 3) valor absoluto de un numero
valorAbsoluto:: Float -> Float
valorAbsoluto nro = sqrt (nro * nro)

-- 4) si un numero es multiplo de 3
esMultiploDe3 nro = esDivisible nro 3  

-- 5) si un numero es divisible de dos numeros a la vez, (divisor comun)

-- 6) elevar un numero a una potencia dada (sin usar **)

potencia2 base exponente = base ^ exponente

--potencia 0 0 = error "no se puede elevar 0 a 0"
potencia base 0 = 1
potencia base exponente = base * potencia base (exponente - 1)
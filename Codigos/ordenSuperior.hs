identidad :: a -> a
identidad x = x

primero :: [a] -> a
primero lista = head lista

ultimo :: [a] -> a
ultimo lista = last lista

larga,empiezaConA,capicua::[Char]->Bool
larga lista = length lista > 6
empiezaConA lista = head lista == 'a'
capicua lista = lista == reverse lista

minimo :: Ord a => a -> a -> a
minimo x y 
   | x < y = x
   | otherwise = y

sumaRara :: Num a => a -> a -> a
sumaRara a b = a + b * 2

--any::(a->Bool)->[a]->Bool



divisionRara :: Fractional a => a -> a -> a
divisionRara a b = a / 2 * b

doble :: Num a => a -> a
doble x = 2 *x
triple :: Num a => a -> a
triple x = x * 3

supera100 tarea numero = tarea numero > 100

--aplica la funcion, pero con los parametros al reves (flip)
f1 :: t1 -> t2 -> (t2 -> t1 -> t3) -> t3
f1 x y z = z y x
--f2 aplica la funcion dada sobre el valor dado. ($) 
f2 a b = a b
f3 :: (t1 -> t2) -> (t3 -> t1) -> t3 -> t2

-- aplica una funcion sobre el resultado de otra, o sea, las compone (.)
f3 a b c = a (b c)
f4 :: Ord a => (t -> a) -> (t -> a) -> t -> (t -> a)

--Dadas dos funciones, obtiene la funcion que devuelve el valor mayor, de aplicarlas sobre un mismo valor 
f4 w e r 
  | w r > e r = w
  | otherwise = e


type Pizza = String
type Porciones = Int
type Pedido = (Pizza,Porciones)
type CantidadDePizzas = Int

lasDeMuzza :: [Pedido]->[Pedido]
lasDeMuzza = filter esMuzza

esMuzza :: Pedido -> Bool
esMuzza = ("Muzza"==).fst

porciones :: [Pedido] -> Porciones
porciones = sum. (map snd)


cantidadPizzas :: Porciones -> CantidadDePizzas
cantidadPizzas  = cantidadRedondeada

cantidadRedondeada :: Porciones -> CantidadDePizzas
cantidadRedondeada porciones
    | ((0 ==).mod porciones) 8  = div porciones 8
    | otherwise = ((+) 1.div porciones) 8

cuantasMuzzas :: [Pedido] -> CantidadDePizzas
cuantasMuzzas = cantidadPizzas.porciones.lasDeMuzza

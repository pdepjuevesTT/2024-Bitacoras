module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

type Pizza = String
type Porciones = Number
type Pedido = (Pizza,Porciones)


lasDeMuzza :: [Pedido]->[Pedido]
lasDeMuzza = filter esMuzza

esMuzza :: Pedido -> Bool
esMuzza = ("Muzza"==).fst

porciones :: [Pedido]-> Porciones
porciones = sum. (map snd)

type Cantidad = Number
cantidadPizzas :: Porciones -> Cantidad
cantidadPizzas = ceiling.(/8)

cuantasMuzzas :: [Pedido]->Cantidad
cuantasMuzzas =cantidadPizzas.porciones.lasDeMuzza

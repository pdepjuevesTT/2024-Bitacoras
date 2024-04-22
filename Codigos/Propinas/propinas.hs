-------------------------------------Primer Punto-------------------------------------

data Tipo = Guarnicion | Bebida | Postre | PlatoPrincipal
type Nombre = String
type Comida = (Nombre,Tipo)

comida1 :: Comida
comida1 = ("Ñoquis con champiñones", PlatoPrincipal)

comida2 :: Comida
comida2 = ("Milanesa napolitana", PlatoPrincipal)

comida3 :: Comida
comida3 = ("Tortilla de papa", PlatoPrincipal)

comida4 :: Comida
comida4 = ("Papas fritas", Guarnicion)

comida5 :: Comida
comida5 = ("Ensalada de rucula", Guarnicion)

comida6 :: Comida
comida6 = ("Tiramisu", Postre)

comida7 :: Comida
comida7 = ("Budin de banana", Postre)

comida8 :: Comida
comida8 = ("Helado", Postre)

comida9 :: Comida
comida9 = ("Limonada", Bebida)

comida10 :: Comida
comida10 = ("Agua", Bebida)

type Precio = Number

calcularPrecio :: Comida -> Precio
calcularPrecio (nombre, PlatoPrincipal) = length nombre * 50
calcularPrecio (nombre, Postre) = length nombre * 30
calcularPrecio (nombre,_) = length nombre *10

-------------------------------------Segundo y Tercer Punto-------------------------------------

--Costo almuerzo-----------------------------------------------------------------------
type Almuerzo = [Comida]
type PrecioAlmuerzo = Number

importeBase :: Almuerzo -> PrecioAlmuerzo
importeBase almuerzo = sum (obtenerListadoPrecios almuerzo)

type ListadoPrecios = [Precio]

obtenerListadoPrecios :: Almuerzo -> ListadoPrecios
obtenerListadoPrecios = map calcularPrecio

-- Opciones de Propina -----------------------------------------------------------------------
type Propina =Number

clasico :: PrecioAlmuerzo -> Propina
clasico costoComida = costoComida*0.1

tioCarlos :: PrecioAlmuerzo -> Propina
tioCarlos costoComida = clasico costoComida/2

conservador :: PrecioAlmuerzo -> Propina
conservador costoComida
    |costoComida > 2000 = 150
    |otherwise = 100

noCreyente :: PrecioAlmuerzo -> Propina
noCreyente _ = 0

recurrente :: PrecioAlmuerzo -> Propina
recurrente costoComida = costoComida*0.2

generoso :: PrecioAlmuerzo -> Propina
generoso _ = 200

-- Calculo de pago total -----------------------------------------------------------------------
type PagoFinal = Number
importeTotal :: Almuerzo -> TipoDeCliente -> PagoFinal
importeTotal almuerzo tipoCliente = calcularPrecioConPropina (importeBase almuerzo) tipoCliente

type TipoDeCliente = PrecioAlmuerzo -> Propina
type PagoConPropina = Number
calcularPrecioConPropina :: PrecioAlmuerzo-> TipoDeCliente -> PagoConPropina
calcularPrecioConPropina costoComida propinaCliente = costoComida + propinaCliente costoComida

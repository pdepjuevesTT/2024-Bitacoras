--------------------------------------- Dominio ---------------------------------------
type Edad = Int
type Nombre = String
type Felicidonios = Int
type Sueño = String


data Persona = UnaPersona{
    edad :: Edad,
    nombre :: Nombre,
    felicidonios :: Felicidonios,
    sueños :: [Sueño]
}

------------------------------ Coeficiente de satisfaccion ------------------------------
type Coeficiente = Int
coeficienteDeSatisfaccion :: Persona -> Coeficiente
coeficienteDeSatisfaccion persona 
    |felicidonios persona > 50 && felicidonios persona <= 100 = moderadamenteFeliz persona
    |felicidonios persona > 100 = muyFeliz persona
    |otherwise = pocoFeliz

muyFeliz :: Persona -> Coeficiente
muyFeliz persona = felicidonios persona * edad persona

moderadamenteFeliz :: Persona -> Coeficiente
moderadamenteFeliz persona = cantidadDeSueños persona * felicidonios persona

type Cantidad = Int
cantidadDeSueños :: Persona -> Cantidad
cantidadDeSueños persona = length (sueños persona)

pocoFeliz :: Coeficiente
pocoFeliz = 40

------------------------------------- Nombre Largo -------------------------------------

nombreLargo :: Persona -> Bool
nombreLargo persona = longitudNombre persona > 10

type Longitud = Int
longitudNombre :: Persona -> Longitud
longitudNombre persona = length (nombre persona)

------------------------------------ Persona Suertuda ------------------------------------

esSuertuda :: Persona -> Bool
esSuertuda persona = even (3 * coeficienteDeSatisfaccion persona)

--------------------------------------- Nombre Lindo --------------------------------------

nombreLindo :: Persona -> Bool
nombreLindo persona = primeraLetraNombre persona == 'L'

type Letra = Char
primeraLetraNombre :: Persona -> Letra
primeraLetraNombre persona = head (nombre persona)

-------------------------------------- Cumplir Sueños --------------------------------------

cumplirSueños :: Persona -> Persona
cumplirSueños persona = quedarseSinSueños (ganarFelicidonios persona)

quedarseSinSueños :: Persona -> Persona
quedarseSinSueños persona = persona {sueños = []}

ganarFelicidonios :: Persona -> Persona
ganarFelicidonios persona = persona { felicidonios = felicidonios persona + felicidoniosGanadosAlCumplirSueños persona}

felicidoniosGanadosAlCumplirSueños :: Persona -> Felicidonios
felicidoniosGanadosAlCumplirSueños persona = coeficienteDeSatisfaccion persona * cantidadDeSueños persona

-------------------------------------- Fuente de los deseos --------------------------------------

tirarMoneda :: Persona -> Persona
tirarMoneda persona = ganar10Felicidonios (fuenteDeLosDeseos persona)

fuenteDeLosDeseos :: Persona -> Persona
fuenteDeLosDeseos persona
    |esSuertuda persona = cumplirSueños persona
    |otherwise = persona

ganar10Felicidonios :: Persona -> Persona
ganar10Felicidonios persona = persona {felicidonios = felicidonios persona + 10}

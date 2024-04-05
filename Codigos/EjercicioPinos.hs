module Library where

---------------------------------primer punto---------------------------------
type Altura = Float
type Peso = Float

pesoPino :: Altura -> Peso
pesoPino altura
    | altura <= longitudMaximaBase = pesoBase altura
    | otherwise = pesoBase longitudMaximaBase + pesoCopa (altura - longitudMaximaBase)

longitudMaximaBase :: Float
longitudMaximaBase = 3

kgPorCmHasta3metros :: Float
kgPorCmHasta3metros = 3

kgPorCmArribaDe3metros :: Float
kgPorCmArribaDe3metros = 2

alturaMaCm :: Float -> Float
alturaMaCm altura = altura*100

pesoBase :: Float -> Float
pesoBase altura = alturaMaCm altura * kgPorCmHasta3metros

pesoCopa :: Float -> Float
pesoCopa altura = alturaMaCm altura * kgPorCmArribaDe3metros

---------------------------------segundo punto---------------------------------
esPesoUtil :: Peso -> Bool
esPesoUtil peso =  peso >=400 && peso<=1000

---------------------------------tercer punto---------------------------------
sirvePino :: Altura -> Bool
sirvePino altura = esPesoUtil (pesoPino altura)

---------------------------------cuarto punto---------------------------------
type Costo = Float
costoTransporte :: Altura -> Costo
costoTransporte altura 
    | esLigero altura = costoTransporteLigero
    | esMediano altura = costoTransporteMediano altura
    | otherwise = costoTransportePesado altura

costoTransporteLigero :: Float
costoTransporteLigero = 5000

costoTransporteMediano :: Altura -> Costo
costoTransporteMediano altura = pesoPino altura *10

costoTransportePesado :: Altura -> Costo
costoTransportePesado altura = costoTransporteMediano altura + alturaMaCm altura

esLigero :: Altura -> Bool
esLigero altura = pesoPino altura < 500

esMediano :: Altura -> Bool
esMediano altura = pesoPino altura >500 && pesoPino altura <800

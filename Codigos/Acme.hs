type Nombre = String 
type Sucursales = Int
type Empleados = Int

cantidadTotalEmpleados :: Sucursales -> Nombre -> Empleados
cantidadTotalEmpleados sucursales nombreEmpresa = sucursales * cantidadEmpleadosSucursal nombreEmpresa

cantidadEmpleadosSucursal :: Nombre -> Empleados
cantidadEmpleadosSucursal "Acme" = 10
cantidadEmpleadosSucursal nombre 
    | terminaConLetraMenor nombre = letrasIntermedias nombre
    | esCapicua nombre && tieneLetrasPar nombre = letrasIntermedias nombre * 2
    | nombreEsDivisiblePor 3 nombre || nombreEsDivisiblePor 7 nombre = 3
    | otherwise = 0

terminaConLetraMenor :: Nombre -> Bool
terminaConLetraMenor nombre = head nombre > last nombre

esCapicua :: Nombre -> Bool
esCapicua nombre = reverse nombre == nombre

tieneLetrasPar :: Nombre -> Bool
tieneLetrasPar nombre = even (length nombre)

letrasIntermedias :: Nombre -> Int
letrasIntermedias nombre = length nombre - 2

esDivisiblePor :: Int -> Int -> Bool
esDivisiblePor divisor dividendo = mod dividendo divisor == 0

nombreEsDivisiblePor :: Int -> Nombre -> Bool
nombreEsDivisiblePor divisor nombre = esDivisiblePor divisor (length nombre)

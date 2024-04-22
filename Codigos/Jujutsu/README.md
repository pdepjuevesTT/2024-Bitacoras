# Jujutsu Haskell
## Dominio
En el mundo de las Maldiciones, seres espirituales cuyo único objetivo es hacer daño, existen algunas personas capaces de controlar su energía de forma que pueden darle pelea a estas maldiciones. A estas personas se las llamó Hechiceros y se les asignaron diferentes grados para medir su fuerza, siendo los grados menores los de mayor fuerza. Además, cada hechicero pertenece a un clan. A partir de esto, se nos pide lo siguiente:

## 1. Queremos poder modelar los siguientes hechiceros:  
- Nobara, una  hechicera estudiante con tan solo un año de antigüedad luchando contra maldiciones, forma parte del clan Kugisaki y es una hechicera de grado 3.
- Satoru, un hechicero maestro de grado 0, que tiene 15 años de antigüedad y es parte del clan Gojo.
- Maki, una estudiante con 3 años de antigüedad, es parte del clan Zenin y tiene un grado 4.
- Yuji, un novato en la escuela de hechicería por lo que posee una antigüedad de 0 años, es parte del clan Itadori y tiene un grado 1.

## 2. Hechicero con experiencia
Nos interesa saber cuando un hechicero tiene experiencia, esto se da cuando el hechicero tiene más de un año de antigüedad.

## 3.Equipos 
Para pelear contra las maldiciones los hechiceros se agrupan en equipos. Nos interesa saber cuándo un equipo está preparado, lo cual se da si el equipo tiene más de 3 integrantes.

## 4. Subir de Grado
Queremos que sea posible subir de grado a nuestros hechiceros a medida que se vuelven más fuertes. Para esto se le restará un punto a su grado, subiendo así a la siguiente categoría. En el caso de que sea un hechicero de grado especial, es decir que su grado es 0, como es el rango máximo, quedará en el mismo rango.

## 5. Prestigio
Existen algunos clanes que poseen cierto prestigio dentro del mundo de la hechicería: el clan Zenin, Gojo y Kamo. Queremos saber si un hechicero es prestigioso, esto se da cuando pertenece a alguno de los tres clanes mencionados.

## 6. Invencibles
Existen algunos grupos que podemos decir que son invencibles, esto sucede cuando existe al menos un integrante que sea de grado especial, ya que son los hechiceros más poderosos y pueden con cualquier maldición.

## 7. Grupo favorito
Queremos saber si un grupo es favorito de los altos mandos, esto se da cuando todos los integrantes del mismo son prestigiosos.

## 8. Expertos
Nos interesa saber de un grupo quienes son los expertos, que estarán al mando de las misiones. Decimos que los expertos serán aquellos que tengan experiencia.

## 9. Grupo Capaz
Queremos saber si un grupo es capaz de hacerle frente a cualquier maldición. Esto puede suceder cuando el grupo es invencible, o bien si está preparado, de forma que pueden tener muchas habilidades para enfrentarla.
Luego de derrotar a una maldición poderosa, ¡la batalla les genera un power up! Queremos que sea posible que un grupo tenga un power up, es decir subirle el grado a cada integrante.

## 10. Misiones
Nuestros hechiceros no solo pueden hacer misiones en equipo, en ciertos casos queremos que tengan misiones en solitario, para esto los del alto mando deben decidir entre dos hechiceros, quien es el más apto. Para ello, comparan el nivel de los hechiceros según el criterio que se necesite:
- Algunas misiones son un poco difíciles, por lo que queremos que vaya aquel hechicero con mayor nivel tryhard. Este se calcula como la división entre 1 y el grado anterior del hechicero. Por ejemplo si un hechicero tiene grado 0, la división sería 1 / (0+1)
- Otras misiones requieren tener cierto nivel burocrático, que dependerá de la cantidad de letras de su clan.
- Mientras que otras van a depender del nivel intimidante, que será la letra mayor de su clan. Por ejemplo, para el clan Itadori, su letra máxima es la t, para el clan Gojo, la letra máxima es la o; en este caso el hechicero más intimidante sería el del clan Itadori.
- Por último, en otros casos necesitamos que tengan un nivel de sigilo que será calculado con la cantidad de años de experiencia multiplicado por 6.

#Juego para que el usuario intente adivinar un número generado aleatoriamente dando pistas de forma que se indique
#si el número introducido es mayor o menor  que el correcto.

#Utilizamos un try-catch en nuestro programa para capturar las excepciones posibles que surjan por un mal uso del usuario o
#por algún fallo no detectado. Los errores más esperados son de tipo de dato(si el usuario introduce un valor no numérico) o los 
#errores que impliquen una contradicción en el juego como indicar un valor que no esté dentro del rango especificado.
#1.0 - En la primera versión del programa se capturará cualquier error y se saldrá de la ejecución sea cual sea este error.
#1.1 - En la segunda versión del programa, se añadirá la modalidad de juego limitado poor intentos, en el que se le pedirá
#al usuario que seleccione el modo de juego y en caso de ser limitado, le pregunte por el número de intentos posibles. (Aún en desarrollo)
try {

  #Una aclaración para no repetirlo en varias ocasiones durante el código, todas las variables del programa  pasarán por un casteo 
  #que solo permitirá valores enteros [int]. Esto responde a la problemática generada por las variables de tipo String que se
  #generarían si no especificáramos el tipo de dato con el que vamos a trabajar.

  #Creamos una variable llamada $intentos en las que se almacenará el número de intentos del usuario hasta que acierta la solución.
  [int]$intentos = 0

  #Creamos también una variable llamada $intentoNum para almacenar el número que el usuario introduzca para jugar y que nos servirá
  #también para comprobar si se ganó ya el juego o no.
  [int]$intentoNum = 0

  #Creamos tanto la variable $minimo que representa el valor mínimo del rango de números posibles para jugar como el $maximo 
  #y se los pedimos al usuario por consola.
  [int]$minimo = Read-Host "Introduce limite inferior para jugar"
  [int]$maximo = Read-Host "Introduce el limite superior para jugar"

  #Con los valores mínimo y máximo y la ayuda del cmdlet Get-Random generamos un nuevo número aleatorio que 
  #será el propuesto para acertar en el juego. ATENCIÓN! No usar -minimum -maximun puesto que se comportan de forma
  #repetitiva y no aleatoria si se introduce el mismo rango de forma repetitiva.
  [int]$random = Get-Random($minimo..$maximo) 

  #Utilizamos un bucle do-while para solicitar al usuario números con los que intentará adivinar la solución. Utilizamos este tipo de bucle porque así nos aseguramos de que se ejecuta al menos una vez y luego se evaluará la condición de salida en cada vuelta.
  do {

    #Pedimos al usuario que introduzca un número y lo almacenamos en $intentoNum
    $intentoNum = Read-Host "Introduce un numero"

    #Para asegurarnos de que el usuario no introduzca un número fuera del rango usamos un if-else comprobando que el valor esté entre
    #el mínimo y el máximo.
    if (($intentoNum -lt $minimo) -or ($intentoNum -gt $maximo)) {
      Write-Warning "El numero no puede estar fuera del rango..."
    }
    else {
      #Mediante un if-elsif-else valoramos si ha acertado el número, si es mayor o si es menor
      if ($intentoNum -eq $random) {
        Write-Host "ENHORABUENA! La solucion era el $random" 
      }
      elseif ($intentoNum -lt $random) {
        Write-Host "El numero es mayor!"
      }
      else {
        Write-Host "El numero es menor!"
      }
    }
    

    #Incrementamos en una unidad el valor de los intentos, pues acertemos o no se debería sumar uno.
    $intentos++
  
  } while ($intentoNum -ne $random)

}
catch {
  Write-Warning "Ha ocurrido un error..."
}
finally {

  #El finally se ejecutará siempre que el programa finalice. En el se indicará que este ha finalizado correctamente y mostrará
  #por consola la informmación del juego con el número de la solución y el número de intentos. Se ejecutará un sleep de 1s
  #para darle más dinamismo al programa y se cerrará.
  Write-Host "----------------------------------------------------------------"
  Write-Host "                      Informacion del juego                              "
  Write-Host "Solucion: $random"
  Write-Host "Intentos: $intentos"
  Write-Host "----------------------------------------------------------------"
  Write-Host "El programa ha finalizado correctamente."
  sleep 1
}


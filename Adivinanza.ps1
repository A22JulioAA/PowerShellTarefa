#Xogo de adiviñar un número aleatorio indicando se o núemero introducido é maior ou menor


#AXUDA GERARDOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
#Por algunha razón se poño o límite inferior por debaixo de 10 o programa deixa de funcionar correctamente. Non sei como solucionalo





#Pedimos dous números, tanto o valor inferior como superior para xerar o aleatorio
$inferior = Read-Host "Introduce o valor inferior "
$superior = Read-Host "Introduce o valor superior "

#Xeramos o número aleatorio para xogar
$aleatorio = Get-Random -Minimum $inferior -Maximum $superior

#Creamos unha variable para valorar se a resposta é correcta ou incorrecta
[bool]$correcto = $false

#Creamos unha variable contador para mostrar ao final o número de intentos utilizados
$count = 0

#Creamos unha lista para almacenar os números introducidos e mostralos ao final na información do xogo
$numeros = New-Object System.Collections.ArrayList

do {
  
  #Pedimos ao usuario un número dentro do rango especificado anteriormente
  $intento = Read-Host "Introduce un numero "

  #Comprobamos que o número introducido esté dentro do rango. Se o está executará o xogo, e se non o está saltará un warning indicando o erro.
  if (($intento -gt $inferior) -and ($intento -lt $superior)) {
    if ($intento -eq $aleatorio) {
      $correcto = $true
    }
    elseif ($intento -lt $aleatorio) {
      Write-Host El numero es mayor que $intento 
      
    }
    else {
      Write-Host El numero es menor que $intento
      
    }
    
    #Aquí añadimos os números introducidos á lista. Ao facer esto imprímese o índice onde se vai almacenando o valor, e non sei como quitalo así que coméntoo para que non moleste
    #$numeros.Add($intento)

  
    if ($correcto -eq $true) {
      Write-Host Has acertado! El numero era el $aleatorio
      $count++
    }
    else {
      $count++
    }
    
  }
  else {
    Write-Warning "El numero no esta dentro del rango..."
  }

} while (
  $correcto -eq $false
)

Write-Host -----------------------------------------
Write-Host Informacion de juego:
Write-Host Valores: $inferior - $superior
Write-Host Numero correcto: $aleatorio
#Write-Host Numeros introducidos: $numeros
Write-Host Has utilizado: $count intentos 
Write-Host -----------------------------------------
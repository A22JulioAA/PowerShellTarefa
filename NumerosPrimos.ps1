#Programa que indica si un número es primo o no 

try {

  Write-Host "Bos dias Gerardo! :))"
  do {

    #A variable booleana sair indicará o estado de saída do programa. Se é false non sairá e se é true, sairá.
    [bool]$sair = $false

    #Declaramos as variables necesarias para establecer un número primo ou non, un contador e unha variable que almacenará o resultado de se o é ou non.
    $count = 2
    [bool]$esPrimo = $true

    #Pedimos o número por consola, especificando o tipo de dato.
    [int]$num = Read-Host "Introduce un numero "

    if ($num -gt 1) {
      while (($esPrimo -eq $true) -and ($count -ne $num)) {
        if ($num % $count -eq 0) {
          $esPrimo = $false
        }
        $count++
      }
  
      if ($esPrimo -eq $true) {
        Write-Host El numero $num ES primo
      }
      else {
        Write-Host El numero $num NO ES primo
      }
  
      
    }else{
      Write-Warning "El valor no puede ser menor 1 o menor..."
    }

    $exit = Read-Host "Introduce un 0 si desea continuar "

    if ($exit -ne 0) {
      $sair = $true
    }
 
  } while ($sair -eq $false)
  

}
catch {
  Write-Warning "Ha ocurrido un error... Puede que hayas introducido un caracter en vez de un numero. Intentalo de nuevo!"
  
}
finally {
  Write-Host "El programa ha finalizado"
  Start-Sleep 2
  Clear-Host
  
}






#Programa que pide números por consola ata que o usuario introduza un 0. Nese momento smostrarase a lista ordenada

#Creamos unha variable que represente o valor de saida do programa
[bool]$exit = $false

#Creamos a lista para almacenar os números
$listaNumeros = New-Object System.Collections.ArrayList

do {
  
  Clear-Host
  $num = Read-Host "Introduce un numero"

  if ($num -ne 0) {
    $listaNumeros.Add($num)
  }else{
    $exit = $true
  }

} while ($exit -eq $false)

Clear-Host

$listaNumeros.Sort()

Write-Host Numeros introducidos: 

foreach ($numero in $listaNumeros) {
  Write-Host $numero
}
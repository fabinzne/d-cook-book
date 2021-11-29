module arrays.arrays;

import std.stdio;

void main() {
  int [] arr;

  arr ~= 1;
  arr ~= [2, 3];

  // Arrays dinamicos podem ser passados diretamente. Já
  // arrays estáticos necessitam estar entre o operador [].

  writeln("The sum of ", arr, " is ", sum(arr));
  writeln("Slicing the array ", arr, " from 0 to 2 is ", arr[0..2]);

  // Ainda temos mais, D suporte uma operação de arrays de vetores
  // como a seguir:

  arr[] = arr[] + 5;

  // Esse código vai adicionar 5 em cada elemento do array.

  writeln("Adding 5 to every element to arr gives ", arr);
}

int sum(
  /* A chave in informar que a variavel é um input e fornece
  para a variavel que ela possui um escopo de constante,
  logo ela não pode ser alterada durante a execução e apenas
  então você mantem uma copia em memoria do array ou informa
  uma referencia para a memoria passada */
  in int[] data
) {
  int total = 0;
  foreach (item; data)
    total += item;
  
  return total;
}

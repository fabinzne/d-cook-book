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

module arrays.arrays;

import std.stdio;

void main() {
  int [] arr;

  arr ~= 1;
  arr ~= [2, 3];

  // Arrays dinamicos podem ser passados diretamente. Já
  // arrays estáticos necessitam estar entre o operador [].

  writeln("The sum of ", arr, " is ", sum(arr));
}

int sum(in int[] data) {
  int total = 0;
  foreach (item; data)
    total += item;
  
  return total;
}
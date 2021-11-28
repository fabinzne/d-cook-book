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

int sum(in int[] data) {
  int total = 0;
  foreach (item; data)
    total += item;
  
  return total;
}

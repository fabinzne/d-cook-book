module arrays.arrays;

import std.stdio;

void main() {
  int [] arr;

  arr ~= 1;
  arr ~= [2, 3];

  writeln("The sum of ", arr, " is ", sum(arr));
}

int sum(in int[] data) {
  int total = 0;
  foreach (item; data)
    total += item;
  
  return total;
}
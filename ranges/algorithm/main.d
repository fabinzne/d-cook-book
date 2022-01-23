module ranges.algorithm.main;

import std.range, std.traits;

auto takeRange(Range)(Range range) {
  if(isInputRange!Range && !isInfinite!Range && isNumeric!(ElementType!Range)) {
    static if(isFloatingPoint!(ElementType!Range)) {
      double sum = 0;
    } else {
      long sum = 0;
    }

    int count = 0;

    foreach (item; range) {
      count++;
      sum += item;
    }

    return sum / count;
  }
}

void main(string[] args) {
  import std.stdio;

  writeln(takeRange([1.0, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
}
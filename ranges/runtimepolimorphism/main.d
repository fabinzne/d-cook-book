module ranges.runtimepolimorphism.main;

void main(string[] args) {
  import std.stdio, std.range;

  InputRange!int myRange = inputRangeObject([1, 2, 3]);

  foreach (int item; myRange) {
    writeln(item);
  }
}
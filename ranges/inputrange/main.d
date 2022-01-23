module ranges.inputrange.main;

import std.range;

struct FibonacciRange {
  enum bool empty = false;
  
  @property int front() {
    return current;
  }

  void popFront() {
    previous = current;
    current = next;
    next = current + previous;
  }

  private {
    int previous = 0;
    int current = 0;
    int next = 1;
  }

  @property FibonacciRange save() { 
    return this;
  }
}

static assert(isForwardRange!FibonacciRange);

FibonacciRange fibonacci() {
  return FibonacciRange();
}

void main(string[] args) {
  import std.stdio;

  auto numbers = fibonacci();

  writeln(numbers.take(15));
}
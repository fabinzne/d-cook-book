module ranges.rangeincollection.main;

struct StackView(T) {
  private const(T)[] data;

  private this(const(T)[] data) {
    this.data = data;
  }

  @property bool empty() const {
    return this.data.length == 0;
  }

  @property const(T) front() const {
    return data[$ - 1];
  }

  void popFront() {
    data = data[0 .. $ - 1];
  }
}

struct Stack(T, size_t expectedMaxSize = 32) {
  T[expectedMaxSize] initialBuffer;
  T[] buffer;

  size_t currentPos;

  bool isEmpty() {
    return currentPos == 0;
  }

  void push(T value) {
    if(buffer is null) {
      buffer = initialBuffer[];
    }

    if(currentPos == buffer.length) {
      buffer.length += 64;
    }

    buffer[currentPos++] = value;
  }

  T pop() {
    if(currentPos == 0) {
      throw new Exception("Empty stack cannot pop.");
    }

    return buffer[--currentPos];
  }

  @property auto view() const {
    return StackView!T(buffer[0 .. currentPos]);
  }
}

void main(string[] args) {
  Stack!int stack;

  stack.push(1);
  stack.push(2);

  import std.stdio;

  writeln(stack.pop());
  writeln(stack.pop());
  assert(stack.isEmpty());
}
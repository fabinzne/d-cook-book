module ranges.treestructure.main;

import std.range;

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

struct TreePart {
  string payload;
  TreePart[] children;
}

void walkTree(void delegate(string) visitor, TreePart root) {
  visitor(root.payload);

  foreach (child; root.children) {
    walkTree(visitor, child);
  }
}

struct TreeVisitor {
  struct Position {
    TreePart root;
    int childPos;
  }

  Stack!(Position) stack;
  Position current;

  this(TreePart root) {
    current.root = root;

    current.childPos = -1;
  }

  @property string front() {
    return current.root.payload;
  }

  @property bool empty() {
    return current.childPos + 1 == current.root.children.length && stack.isEmpty;
  }

  void popFront() {
    current.childPos++;

    if(current.childPos == current.root.children.length) {
      current = stack.pop();

      if(!empty) {
        popFront();
      }
    } else {
      stack.push(current);

      current.root = current.root.children[current.childPos];

      current.childPos = -1;
    }
  }
}

static assert(isInputRange!TreeVisitor);

void main() {
  import std.stdio;

  void visitor(string part) {
    writeln(part);
  }

  TreePart root;
  root.payload = "one";
  root.children = [TreePart("two", [TreePart("three", null)]), TreePart("three", null)];

  walkTree(&visitor, root);

  writeln("****");

  foreach (part; TreeVisitor(root)) {
    visitor(part);
  }
}
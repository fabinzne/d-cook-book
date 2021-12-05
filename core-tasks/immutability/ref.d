module immutability.reference;

void foo(int a) {
  a = 10;
}

void bar(ref int a) {
  a = 10;
}

void main() {
  int test = 0;

  foo(*test);
  assert(test == 0);
  bar(test);
  assert(test == 10);
}
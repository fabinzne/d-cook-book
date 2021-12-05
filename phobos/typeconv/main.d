module phobos.typeconv.main;

import std.conv;

void main() {
  const toConvert = "333";

  auto converted = to!int(toConvert);

  import std.stdio;

  writeln(converted);

  if(converted == 333) {
    writeln("Conversion succeeded\n");
  } else {
    writeln("Conversion failed\n");
  }
}
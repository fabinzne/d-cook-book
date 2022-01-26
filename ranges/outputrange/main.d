module ranges.outputrange.main;


import std.range;
import std.conv;

struct Dumper {
  import std.stdio;

  int outputted = 0;

  void put(in void[] data) {
    foreach(key; cast(const ubyte[]) data){
      writef("%02x ", key);
      outputted++;

      if(outputted == 16) {
        writeln();
        outputted = 0;
      }
    }
  }

  ~this() {
    writeln();
  }
}

static assert(isOutputRange!(Dumper, ubyte));
static assert(isOutputRange!(Dumper, char));

void main(string[] args) {
  Dumper dump;

  dump.put("Hello, world! In Hex.");
}
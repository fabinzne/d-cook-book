module phobos.digest.main;

void main(string[] args) {
  import std.digest.md, std.stdio, std.range;

  File file;

  if(args.length > 1) {
    file = File(args[1], "rb");
  } else {
    file = stdin;
  }

  MD5 digest;

  digest.start();
  put(digest, file.byChunk(1024));

  writeln(toHexString(digest.finish()));
}
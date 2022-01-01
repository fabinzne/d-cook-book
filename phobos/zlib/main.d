module phobos.zlib.main;

void main() {
  import std.zlib, std.file;

  auto compressor = new Compress(HeaderFormat.gzip);
  void[] compressedData;

  compressedData ~= compressor.compress("Hello, ");
  compressedData ~= compressor.compress("world!");
  compressedData ~= compressor.flush();

  std.file.write("compressed.gz", compressedData);

  auto decompressor = new UnCompress(HeaderFormat.gzip);

  void[] decompressedData;

  decompressedData ~= decompressor.uncompress(compressedData);

  std.file.write("decompressed.txt", decompressedData);
}
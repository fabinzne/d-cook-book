module phobos.largestfile.main;


void main() {
  import std.stdio;
  import std.file;
  import std.algorithm;
  import std.range;
  import std.datetime;

  DirEntry[] entries;

  foreach (DirEntry entry; dirEntries("./", SpanMode.depth)) {
    entries ~= entry;
  }

  auto sorted = sort!((a, n) => a.size > b.size)(entries);

  auto filtered = sorted.filter!((a) => 
    Clock.currTime() - a.timeLastModified > 14.days);
  
  foreach (entry; filtered.take(10)) {
    remove(entry.name);
  }
}
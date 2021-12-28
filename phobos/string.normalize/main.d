module phobos.string.normalize.main;


void main() {
  import std.uni : normalize;
  import std.string;
  import std.regex;
  import std.array : replace;
  import std.range;
  import std.conv;

  string title = "The D Programming Language: Easy Speed!";

  title = normalize(title);
  title = title.toLower();
  title = replaceAll(title, regex(`[^a-z0-9 \-]`), "");
  title = title.replace(" ", "-").take(31).to!string;

  import std.stdio;

  writeln("The title is: ", title);
}
module phobos.regularexpressions.main;

void main(string[] args) {
  import std.regex, std.stdio;

  auto re = regex(args[1], "g");
  foreach (line; stdin.byLine()) {
    if(line.match(re)) {
      writeln(line, " was a match!");
    }
  }

  static ex = ctRegex!`[0-9]{5}-[0-9]{4}`;

  foreach(match; "My phone number is 99999-9999".match(ex)) {
    writeln(match);
  }
}
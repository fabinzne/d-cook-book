module associative.array;

void main() {
  import std.stdio, std.string;

  string[string] replacements = 
    ["test": "passed", "text": "replaces"];

  replacements["foo"] = "bar";

  assert(replacements["test"] == "passed");
  foreach (line; stdin.byLine()) {
    line = line.strip(); // Remove espaços em branco

    if(auto replacement = line in replacements) {
      // Se sim, printa a variavel replacement e depois remove a mesma
      writeln(line, " => ", *replacement);
      replacements.remove(line.idup);
    } else {
      // Se não, adiciona a mesma ao array
      writeln(line);
      replacements[line.idup] = "previously inserted!";
    }
  }

  foreach (line, replacement; replacements) {
    writeln("Mapping ", line, " => ", replacement);
  }
}
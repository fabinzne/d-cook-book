module phobos.rng.main;

import std.random, std.string, std.conv, std.stdio;

int playRound(ref Random generator, File userInput, File saveFile) {
  int tries = 0;

  auto value = uniform(0, 100, generator);

  writeln("Guess a number between 0 and 100:");

  while(true) {
    tries++;

    auto guess = userInput.readln().strip().to!int;

    if(saveFile.isOpen) saveFile.writeln(guess);

    if(guess == value) break;

    writefln("Your guess of %s was too %s, please try again.", guess, guess > value ? "high" : "low");
  }

  writefln("Correct! You guessed %d in %d tries.", value, tries);

  return tries;
}

void main(string[] args) {
  Random gen;
  File userInput, saveFile;

  if(args.length > 1) {
    userInput = File(args[1], "rt");
    gen.seed(to!uint(userInput.readln().strip()));
  } else {
    userInput = stdin;

    auto seed = unpredictableSeed;

    gen.seed(seed);

    saveFile = File("replay.txt", "wt");

    saveFile.writeln(seed);
  }

  int totalTries = 0;

  foreach (round; 0 .. 3) {
    totalTries += playRound(gen, userInput, saveFile);
  }

  writefln("You guessed three numbers in %s tries!", totalTries);
}

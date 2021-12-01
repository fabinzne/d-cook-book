module slicing.substring;

void main(){
  string s = "月明かり is some Japanese text.";

  import std.string;

  string japaneseText = s[0 .. s.indexOf(" ")];

  import std.stdio;

  foreach (index, char c; japaneseText) {
    writefln("UFT-8 Code unit at index %d is %d", index, c);
  }

  foreach (dchar c; japaneseText) {
    writefln("UTF-32 Code unit at index %d is %c", c, c);
  }
}
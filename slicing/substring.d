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

// D also supports UTF-16 and UTF-32 strings. These are typed wstring and dstring, 
// respectively. Let's look at each of these as follows:
//  -> wstring: This is very useful on Windows, because the Windows operating system 
//     natively works with UTF-16.
//
//  -> dstring: This eats a lot of memory, about 4 times more than strings for English text, 
//     but sidesteps some of the issues discussed here. The reason is that each array index 
//     corresponds to one Unicode code point
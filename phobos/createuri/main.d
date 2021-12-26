module phobos.createuri.main;

pure char[] makeDataUri(string contentType, in void[] data) {
  import std.base64;

  return "data:" ~ contentType ~ ";base64," ~ Base64.encode(cast(const(ubyte[])) data);
}

void main(string[] args) {
  import std.file : read, readText, write;
  import std.array : replace;

  auto image = read("image.jpg");

  auto dataUri = makeDataUri("image/jpg", image);

  auto cssText = readText("style.css");

  auto newCssText = replace(cssText, "www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", dataUri);

  write("newcss.css", newCssText);
}
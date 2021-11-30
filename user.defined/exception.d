module user.defined.exception;

class CustomException : Exception {
    this(string message,
         string file = __FILE__,
         size_t line = __LINE__,
         Throwable next = null) {
      super(message, file, line, next);
    }
}


void main() {
  import std.stdio;

  try
    throw new CustomException("Message here");
  catch (CustomException e) 
    writeln("Caught ", e);
}
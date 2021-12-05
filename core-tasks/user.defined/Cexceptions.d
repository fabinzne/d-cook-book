module user.defined.cexceptions;

void main() {
  import core.sys.posix.unistd; // Para a função Posix low-level
  import core.sys.posix.fcntl; // Para mais funções Posix low-level
  import std.exception; // Para a classe ErrnoException

  auto fd = open("myfile.txt", O_RDONLY);

  if(fd == -1)
    throw new ErrnoException("Could not open myfile.txt");
  scope(exit) close(fd);
}



module phobos.network.server;

void main() {
  import std.socket, std.stdio;

  auto listener = new Socket(AddressFamily.INET, SocketType.STREAM);

  listener.bind(new InternetAddress("localhost", 2525));

  listener.listen(10);

  auto readSet = new SocketSet();
  Socket[] connectedClients;
  char[1024] buffer;
  bool isRunning = true;

  while(isRunning) {
    readSet.reset();

    readSet.add(listener);

    foreach (client; connectedClients) readSet.add(client);
      
    if(Socket.select(readSet, null, null)) {
      foreach (client; connectedClients) {
        if(readSet.isSet(client)) {
          // Lê os dados recebidos e envia eles novamente
          
          auto got = client.receive(buffer);

          client.send(buffer[0 .. got]);
        }
      }

      if(readSet.isSet(listener)) {
        // O listener esta pronto para ler, isso significa
        // que um novo cliente quer se conectar. Nos aceitamos isso aqui:

        auto newScoket = listener.accept();

        writeln("Hello for new Cliente ", newScoket.hostName());

        newScoket.send("Hello!\n");
        connectedClients ~= newScoket;
      }
    }
  }
}
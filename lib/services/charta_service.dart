// ignore: unused_import
import 'package:socket_io_client/socket_io_client.dart' as IO;


class ChartaService {

IO.Socket? _socket;

void conectare(){
  _socket = IO.io('https//192.168.1.135:3200',
  IO.OptionBuilder()
  .setTransports(['websocket'])
  .enableAutoConnect()
  .build()
  );

_socket!.onConnect((_){

_socket!.on('CLIENT_JOINED', (payload){
//TODO Al usuario que haya llegado lo meteré en el almacén para verlo en pantalla
});

_socket!.on('CLIENT_LEFT',(payload){
//TODO Borraré ese usuario del almacen y desaparecerá de pantalla
});

_socket!.on("CLIENT_MOVED", (payload){
//TODO Cambiaré la posición del usuario
});

_socket!.on('GET_CLIENTES', (payload){
  //TODO le llega la lista de clientes
});

});


_socket!.connect();

}

void finire(){
  _socket!.disconnect();
  _socket!.dispose();
  _socket = null;
}

}
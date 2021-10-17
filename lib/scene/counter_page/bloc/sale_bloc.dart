import 'dart:async';

import 'package:di_demo/model/sale_data.dart';
import 'package:di_demo/scene/counter_page/repository/i_constant_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

@injectable
class SaleBloc {
  final IConstantRepository _constantRepository;
  late IO.Socket _socket;
  late String socketUrl;

  final _saleDataController = StreamController<List<SaleData>>();

  void addResponse(List<dynamic> data) {
    _saleDataController.sink
        .add(data.map((e) => SaleData.fromJson(e)).toList());
  }

  Stream<List<SaleData>> get getResponse => _saleDataController.stream;

  SaleBloc(this._constantRepository) {
    socketUrl = _constantRepository.getSocketUrl();
    _socket = IO.io(
      socketUrl,
      IO.OptionBuilder().setTransports(['websocket']).setTimeout(3000).build(),
    );
    if (!_socket.connected) {
      _socket.onConnect((_) => print('connect'));
      _socket.onDisconnect((_) => print('disconnect'));
      _socket.onError((data) => print('onError'));
      _socket.on('sale_data', (data) => addResponse(data));
    }
  }

  void dispose() {
    _socket.disconnect();
    _saleDataController.close();
  }
}

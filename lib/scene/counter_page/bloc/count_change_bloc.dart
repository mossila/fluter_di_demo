
import 'dart:async';

import 'package:di_demo/scene/counter_page/repository/i_counter_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class CounterBloc {
  final ICounterRepository _counterRepository;

  CounterBloc(this._counterRepository);

  int _value = 0;
  final _counterController = StreamController<int>();
  int get value => _value;
  get counterStream => _counterController.stream;

  void increment() {
    _value += _counterRepository.getIncrement();
    _counterController.sink.add(_value);
  }
  dispose() {
    _counterController.close();
  }
}
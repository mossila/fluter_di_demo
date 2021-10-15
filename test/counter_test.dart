import 'package:di_demo/scene/counter_page/bloc/count_change_bloc.dart';
import 'package:di_demo/scene/counter_page/repository/i_counter_repository.dart';
import 'package:di_demo/inject/inject.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'counter_test.mocks.dart';

@GenerateMocks([ICounterRepository])
void main() {

  test(
    'Should do something',
    () {
      var mockCounterRepository = MockICounterRepository();
      when(mockCounterRepository.getIncrement()).thenReturn(123);

      final counter = CounterBloc(mockCounterRepository);
      counter.increment();
      expect(counter.value, equals(123));
    },
  );
}

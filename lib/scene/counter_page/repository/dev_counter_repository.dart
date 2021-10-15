import 'package:di_demo/inject/inject.dart';
import 'package:injectable/injectable.dart';
import 'i_counter_repository.dart';

@Injectable(as: ICounterRepository, env: [Env.dev])
class DevCounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 2;
}
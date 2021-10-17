import 'package:di_demo/inject/inject.dart';
import 'package:di_demo/scene/counter_page/repository/i_constant_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IConstantRepository, env: [Env.dev])
class DevConstantRepository implements IConstantRepository {
  @override
  String getSocketUrl() => 'http://192.168.1.38:3000';
}

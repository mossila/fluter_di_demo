import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'inject.config.dart';
abstract class Env {
  static const prod = "prod";
  static const dev = "dev";
  static const test = 'test';
}
final GetIt getIt = GetIt.instance;
@injectableInit
GetIt configureDependencies(String environment) =>
    $initGetIt(getIt, environment: environment);


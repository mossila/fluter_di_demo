// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../scene/counter_page/bloc/count_change_bloc.dart' as _i6;
import '../scene/counter_page/repository/counter_repository.dart' as _i4;
import '../scene/counter_page/repository/dev_counter_repository.dart' as _i5;
import '../scene/counter_page/repository/i_counter_repository.dart' as _i3;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ICounterRepository>(() => _i4.CounterRepository(),
      registerFor: {_prod});
  gh.factory<_i3.ICounterRepository>(() => _i5.DevCounterRepository(),
      registerFor: {_dev});
  gh.factory<_i6.CounterBloc>(
      () => _i6.CounterBloc(get<_i3.ICounterRepository>()));
  return get;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/cubit/app_cubit.dart' as _i3;
import '../../presentation/message/cubit/message_cubit.dart' as _i5;
import '../navigation/router.gr.dart' as _i4;
import 'module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppCubit>(() => _i3.AppCubit());
  gh.lazySingleton<_i4.AppRouter>(() => registerModule.router);
  gh.lazySingleton<_i5.MessageCubit>(() => _i5.MessageCubit());
  return get;
}

class _$RegisterModule extends _i6.RegisterModule {}

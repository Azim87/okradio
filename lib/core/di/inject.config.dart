// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/cubit/app_cubit.dart' as _i4;
import '../../data/local_data.dart' as _i6;
import '../../presentation/archive/archive_details/cubit/archive_details_cubit.dart'
    as _i13;
import '../../presentation/archive/cubit/archive_cubit.dart' as _i12;
import '../../presentation/message/cubit/message_cubit.dart' as _i7;
import '../../presentation/schedule/cubit/schedule_cubit.dart' as _i9;
import '../../presentation/widgets/socal_network_functions.dart' as _i10;
import '../../repository/archive_repsoitory.dart' as _i11;
import '../navigation/router.gr.dart' as _i5;
import '../newtork/api.dart' as _i3;
import '../newtork/network_checker.dart' as _i8;
import 'module.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Api>(() => _i3.Api());
  gh.lazySingleton<_i4.AppCubit>(() => _i4.AppCubit());
  gh.lazySingleton<_i5.AppRouter>(() => registerModule.router);
  gh.lazySingleton<_i6.LocalData>(() => _i6.LocalData());
  gh.lazySingleton<_i7.MessageCubit>(() => _i7.MessageCubit());
  gh.lazySingleton<_i8.NetworkChecker>(() => _i8.NetworkChecker());
  gh.factory<_i9.ScheduleCubit>(() => _i9.ScheduleCubit());
  gh.singleton<_i10.SocialNetworkFucntion>(_i10.SocialNetworkFucntion());
  gh.lazySingleton<_i11.ArchiveRepository>(() => _i11.ArchiveRepository(
      get<_i3.Api>(), get<_i6.LocalData>(), get<_i8.NetworkChecker>()));
  gh.lazySingleton<_i12.ArchiveCubit>(
      () => _i12.ArchiveCubit(get<_i11.ArchiveRepository>()));
  gh.factory<_i13.ArchiveDetailsCubit>(
      () => _i13.ArchiveDetailsCubit(get<_i11.ArchiveRepository>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}

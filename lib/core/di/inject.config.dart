// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ok_radio_flutter/application/cubit/app_cubit.dart' as _i4;
import 'package:ok_radio_flutter/core/di/module.dart' as _i13;
import 'package:ok_radio_flutter/core/navigation/router.gr.dart' as _i5;
import 'package:ok_radio_flutter/core/newtork/api.dart' as _i3;
import 'package:ok_radio_flutter/core/newtork/network_checker.dart' as _i7;
import 'package:ok_radio_flutter/presentation/archive/archive_details/cubit/archive_details_cubit.dart'
    as _i12;
import 'package:ok_radio_flutter/presentation/archive/cubit/archive_cubit.dart'
    as _i11;
import 'package:ok_radio_flutter/presentation/message/cubit/message_cubit.dart'
    as _i6;
import 'package:ok_radio_flutter/presentation/schedule/cubit/schedule_cubit.dart'
    as _i8;
import 'package:ok_radio_flutter/presentation/widgets/socal_network_functions.dart'
    as _i9;
import 'package:ok_radio_flutter/repository/archive_repsoitory.dart' as _i10;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Api>(() => _i3.Api());
    gh.lazySingleton<_i4.AppCubit>(() => _i4.AppCubit());
    gh.lazySingleton<_i5.AppRouter>(() => registerModule.router);
    gh.lazySingleton<_i6.MessageCubit>(() => _i6.MessageCubit());
    gh.factory<_i7.NetworkChecker>(() => _i7.NetworkChecker());
    gh.factory<_i8.ScheduleCubit>(() => _i8.ScheduleCubit());
    gh.singleton<_i9.SocialNetworkFucntion>(_i9.SocialNetworkFucntion());
    gh.lazySingleton<_i10.ArchiveRepository>(() => _i10.ArchiveRepository(
          gh<_i3.Api>(),
          gh<_i7.NetworkChecker>(),
        ));
    gh.lazySingleton<_i11.ArchiveCubit>(
        () => _i11.ArchiveCubit(gh<_i10.ArchiveRepository>()));
    gh.factory<_i12.ArchiveDetailsCubit>(
        () => _i12.ArchiveDetailsCubit(gh<_i10.ArchiveRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}

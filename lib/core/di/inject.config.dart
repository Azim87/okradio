// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ok_radio_flutter/application/cubit/app_cubit.dart' as _i4;
import 'package:ok_radio_flutter/core/newtork/api.dart' as _i3;
import 'package:ok_radio_flutter/core/newtork/network_checker.dart' as _i6;
import 'package:ok_radio_flutter/presentation/archive/archive_details/cubit/archive_details_cubit.dart'
    as _i11;
import 'package:ok_radio_flutter/presentation/archive/cubit/archive_cubit.dart'
    as _i10;
import 'package:ok_radio_flutter/presentation/message/cubit/message_cubit.dart'
    as _i5;
import 'package:ok_radio_flutter/presentation/schedule/cubit/schedule_cubit.dart'
    as _i7;
import 'package:ok_radio_flutter/presentation/widgets/socal_network_functions.dart'
    as _i8;
import 'package:ok_radio_flutter/repository/archive_repsoitory.dart' as _i9;

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
    gh.lazySingleton<_i3.Api>(() => _i3.Api());
    gh.lazySingleton<_i4.AppCubit>(() => _i4.AppCubit());
    gh.lazySingleton<_i5.MessageCubit>(() => _i5.MessageCubit());
    gh.factory<_i6.NetworkChecker>(() => _i6.NetworkChecker());
    gh.factory<_i7.ScheduleCubit>(() => _i7.ScheduleCubit());
    gh.singleton<_i8.SocialNetworkFucntion>(_i8.SocialNetworkFucntion());
    gh.lazySingleton<_i9.ArchiveRepository>(() => _i9.ArchiveRepository(
          gh<_i3.Api>(),
          gh<_i6.NetworkChecker>(),
        ));
    gh.lazySingleton<_i10.ArchiveCubit>(
        () => _i10.ArchiveCubit(gh<_i9.ArchiveRepository>()));
    gh.factory<_i11.ArchiveDetailsCubit>(
        () => _i11.ArchiveDetailsCubit(gh<_i9.ArchiveRepository>()));
    return this;
  }
}

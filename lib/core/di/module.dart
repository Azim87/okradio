import 'package:injectable/injectable.dart';

import '../navigation/router.gr.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter get router => AppRouter();
}

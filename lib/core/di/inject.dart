import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'inject.config.dart';

final get = GetIt.instance;

@InjectableInit()
Future<void> inject() async => get.init();

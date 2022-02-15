import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

late final GetIt injector;

@InjectableInit(initializerName: r'$loadDataApplicationLayerInjectorModule')
FutureOr<void> loadDataApplicationLayerInjectorModule(GetIt appInjector) {
  injector = appInjector;
  $loadDataApplicationLayerInjectorModule(injector);
}

@module
abstract class RegisterModule {
  @lazySingleton
  String get baseUrl => 'http://localhost:8080';
}

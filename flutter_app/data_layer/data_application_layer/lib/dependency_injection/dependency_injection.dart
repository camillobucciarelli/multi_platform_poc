import 'dart:async';

import 'package:dio/dio.dart';
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
  Dio get dio => Dio()..interceptors.add(LogInterceptor());
}

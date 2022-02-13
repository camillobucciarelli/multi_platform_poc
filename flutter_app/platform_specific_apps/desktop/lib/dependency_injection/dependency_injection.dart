import 'dart:async';

import 'package:data_application_layer/data_application_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_app/dependency_injection/dependency_injection.config.dart';

late final GetIt injector;

@InjectableInit(
  initializerName: r'loadInjectionModule',
  asExtension: true,
)
void injectionModule() {}

FutureOr<void> loadPlatformSpecificAppInjectorModule(GetIt appInjector) {
  injector = appInjector;
  appInjector
    ..loadDataApplicationLayerInjectorModule()
    ..loadInjectionModule();
}

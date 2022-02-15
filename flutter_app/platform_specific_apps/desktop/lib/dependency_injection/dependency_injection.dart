import 'dart:async';

import 'package:data_application_layer/dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_app/dependency_injection/dependency_injection.config.dart';

late final GetIt injector;

@InjectableInit(
  initializerName: r'loadInjectionModule',
  asExtension: true,
)
FutureOr<void> loadPlatformSpecificAppInjectorModule(GetIt appInjector) async {
  injector = appInjector;
  appInjector.loadInjectionModule();
  await loadDataApplicationLayerInjectorModule(appInjector);
}

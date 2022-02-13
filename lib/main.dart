import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:platform_app/platform_app.dart';

final injector = GetIt.I;

void main() {
  loadPlatformSpecificAppInjectorModule(injector);
  runApp(const Application());
}

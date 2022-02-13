import 'dart:io';

import 'package:yaml_edit/yaml_edit.dart';

const pubSpecPath = 'pubspec.yaml';

const platformPackageName = 'platform_app';

const supportedPlatform = ['desktop', 'mobile'];

Map<String, dynamic> _platformPackageValue(String activePlatform) =>
    {'path': 'flutter_app/platform_specific_apps/$activePlatform'};

void main(List<String> arguments) async {
  try {
    // check arguments
    if (arguments.isEmpty || !supportedPlatform.contains(arguments.first)) {
      throw Exception('arguments contains platform not supported yet.');
    }
    // check if pubspec.yaml exists
    final pubSpecFile = File(pubSpecPath);
    if (!await pubSpecFile.exists()) {
      throw Exception('pubspec.yaml not found.');
    }
    final pubSpecContent = await pubSpecFile.readAsString();
    final pubSpecYamlEditor = YamlEditor(pubSpecContent);
    print(
      '$platformPackageName value before update: ${pubSpecYamlEditor.parseAt(
        ['dependencies', platformPackageName],
      )}',
    );
    pubSpecYamlEditor.update(
      ['dependencies', platformPackageName],
      _platformPackageValue(arguments.first),
    );
    pubSpecFile.writeAsString(pubSpecYamlEditor.toString());
    print(
      '$platformPackageName value after update: ${pubSpecYamlEditor.parseAt(
        ['dependencies', platformPackageName],
      )}',
    );
  } catch (e) {
    print('Something went wrong error: $e');
    exit(1);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:mod_reserve/src/common/di/injector.dart';
import 'package:mod_reserve/src/features/app/pages/app.dart';

void main() {
  injectDependencies();

  usePathUrlStrategy();

  runApp(const ModReserveApp());
}

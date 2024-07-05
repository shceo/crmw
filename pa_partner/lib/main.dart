import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:pa_partner/src/common/di/injector.dart';
import 'package:pa_partner/src/features/app/pages/app.dart';

void main() {
  injectDependencies();

  usePathUrlStrategy();

  runApp(const PaPartnerApp());
}

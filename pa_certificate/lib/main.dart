import 'package:flutter/material.dart';
import 'package:pa_certificate/src/common/di/injector.dart';
import 'package:pa_certificate/src/features/app/pages/app.dart';

void main() {
  injectDependencies();

  runApp(const PaCertificateApp());
}

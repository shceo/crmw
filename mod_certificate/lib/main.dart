import 'package:flutter/material.dart';
import 'package:mod_certificate/src/common/di/injector.dart';
import 'package:mod_certificate/src/features/app/pages/app.dart';


void main() {
  injectDependencies();

  runApp(const ModCertificateApp());
}

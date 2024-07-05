import 'package:flutter/material.dart';
import 'package:pa_admin/src/common/di/injector.dart';
import 'package:pa_admin/src/features/app/pages/app.dart';

void main() {
  injectDependencies();

  runApp(const PaAdminApp());
} 

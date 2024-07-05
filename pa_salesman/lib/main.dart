import 'package:flutter/material.dart';
import 'package:pa_salesman/src/common/di/injector.dart';
import 'package:pa_salesman/src/feature/app/pages/app.dart';

void main() {
  injectDependencies();

  runApp(const PaSalesmanApp());
}

import 'package:flutter/material.dart';
import 'package:pa_customer/src/common/di/injector.dart';
import 'package:pa_customer/src/features/app/pages/app.dart';

void main() {
  injectDependencies();

  runApp(const PaCustomerApp());
}

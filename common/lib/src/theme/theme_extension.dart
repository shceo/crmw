import 'package:common/src/theme/crm_theme.dart';
import 'package:common/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  CrmTheme get theme => ThemeProvider.of(this).theme;

  ThemeData get themeData => ThemeProvider.of(this).themeData;
}

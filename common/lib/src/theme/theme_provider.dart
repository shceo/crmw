import 'package:common/src/theme/crm_theme.dart';
import 'package:flutter/material.dart';

final class ThemeProvider extends InheritedWidget {
  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  final CrmTheme theme;
  final ThemeData themeData;

  const ThemeProvider({
    required this.theme,
    required this.themeData,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return theme != oldWidget.theme && themeData != oldWidget.themeData;
  }
}

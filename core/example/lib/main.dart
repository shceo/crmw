import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CommonExample());
}

class CommonExample extends StatelessWidget {
  const CommonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: lightTheme,
      themeData: generateThemeData(lightTheme),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            localizationsDelegates: CrmLocalization.localizationsDelegates,
            supportedLocales: CrmLocalization.supportedLocales,
            home: const Placeholder(),
            theme: context.themeData,
          );
        },
      ),
    );
  }
}

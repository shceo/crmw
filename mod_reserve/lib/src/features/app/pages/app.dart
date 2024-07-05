import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/common/navigation/app_router.dart';
import 'package:mod_reserve/src/common/navigation/configurations.dart';
import 'package:mod_reserve/src/features/app/cubit/app_cubit.dart';

class ModReserveApp extends StatefulWidget {
  const ModReserveApp({super.key});

  @override
  State<ModReserveApp> createState() => _ModReserveAppState();
}

class _ModReserveAppState extends State<ModReserveApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    final initialConfig = searchEventConfig();

    _router = AppRouter.router(
      initialLocation: initialConfig.path,
      initialExtra: initialConfig.args,
    );
  }

  CrmTheme _crmTheme(AppState appState) {
    return switch (appState.themeType) {
      ThemeType.light => lightTheme,
      ThemeType.dark => throw UnimplementedError(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AppCubit>(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final theme = _crmTheme(state);

          return ThemeProvider(
            theme: theme,
            themeData: generateThemeData(theme),
            child: Builder(
              builder: (context) {
                return MaterialApp.router(
                  title: 'Mod Reserve',
                  scrollBehavior: AppScrollBehavior(),
                  routerDelegate: _router.routerDelegate,
                  routeInformationParser: _router.routeInformationParser,
                  routeInformationProvider: _router.routeInformationProvider,
                  supportedLocales: CrmLocalization.supportedLocales,
                  backButtonDispatcher: RootBackButtonDispatcher(),
                  localizationsDelegates: const [
                    CountryLocalizations.delegate,
                    ...CrmLocalization.localizationsDelegates,
                  ],
                  theme: context.themeData,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

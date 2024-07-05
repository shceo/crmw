import 'package:common/common_localization_export.dart';
import 'package:common/common_shared_cubit_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pa_certificate/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_certificate/src/common/di/injector.dart';
import 'package:pa_certificate/src/common/navigation/app_router.dart';
import 'package:pa_certificate/src/common/navigation/configurations.dart';
import 'package:pa_certificate/src/features/app/cubit/app_cubit.dart';

class PaCertificateApp extends StatefulWidget {
  const PaCertificateApp({super.key});

  @override
  State<PaCertificateApp> createState() => _PaCertificateAppState();
}

class _PaCertificateAppState extends State<PaCertificateApp> {
  final AppOverlayCubit _overlayCubit = i.get<AppOverlayCubit>();
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _overlayCubit.applyStyle(
      _calculateSystemOverlay(),
    );

    final initialConfig = giftCertificateConfig();

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

  SystemUiOverlayStyle _calculateSystemOverlay([ThemeType? themeType]) {
    final lightStyle = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    const darkStyle = SystemUiOverlayStyle.dark;

    if (themeType != null) {
      return switch (themeType) {
        ThemeType.light => lightStyle,
        ThemeType.dark => darkStyle,
      };
    }

    return lightStyle;
  }

  void _overlayListener(
    ThemeType themeType,
    AppOverlayState state,
  ) {
    if (state.shouldReset) {
      _overlayCubit.reset(
        _calculateSystemOverlay(themeType),
      );
    } else if (state.shouldUpdateRoot) {
      _overlayCubit.replaceRoot(
        _calculateSystemOverlay(themeType),
      );
      SystemChrome.setSystemUIOverlayStyle(
        state.style!,
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        state.style!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AppOverlayCubit>(
      child: CubitScope<AppCubit>(
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, appState) {
            final theme = _crmTheme(appState);
            return ThemeProvider(
              theme: theme,
              themeData: generateThemeData(theme),
              child: BlocConsumer<AppOverlayCubit, AppOverlayState>(
                listener: (context, state) => _overlayListener(
                  appState.themeType,
                  state,
                ),
                builder: (context, state) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    routerDelegate: _router.routerDelegate,
                    routeInformationParser: _router.routeInformationParser,
                    routeInformationProvider: _router.routeInformationProvider,
                    localizationsDelegates: const [
                      CountryLocalizations.delegate,
                      ...CrmLocalization.localizationsDelegates,
                    ],
                    supportedLocales: CrmLocalization.supportedLocales,
                    theme: context.themeData,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

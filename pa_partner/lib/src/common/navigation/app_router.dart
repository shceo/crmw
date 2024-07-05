import 'package:common/common_navigation_export.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pa_partner/src/common/di/injector.dart';
import 'package:pa_partner/src/common/navigation/routes.dart';
import 'package:pa_partner/src/features/add_block_page/pages/add_block_page.dart';
import 'package:pa_partner/src/features/add_shutdown_page/pages/add_shutdown_page.dart';
import 'package:pa_partner/src/features/blocks_page/pages/blocks_page.dart';
import 'package:pa_partner/src/features/main/pages/main_page.dart';
import 'package:pa_partner/src/features/sign_in_page/pages/sign_in_page.dart';

abstract final class AppRouter {
  static final _initialRoute = Routes.mainPath.route;

  static late GoRouter appRouter;

  // Here we will pass MainSearchArgs.
  // ignore: unused_field
  static final _initialExtra = UnimplementedError();
  static final _routerNotifier = RouterNotifier();
  static final _i = i;

  static final _appRoutes = <RouteBase>[
    CrmRouteBuilder<MainPage>(
      i: _i,
      routeConfig: Routes.mainPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<BlocksPage>(
      i: _i,
      routeConfig: Routes.blocksPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<AddBlockPage>(
      i: _i,
      routeConfig: Routes.addBlockPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<AddShutdownPage>(
      i: _i,
      routeConfig: Routes.addShutdownPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<SignInPage>(
      i: _i,
      routeConfig: Routes.signInPath,
    ).buildTransparentRoute(),
  ];

  static GoRouter router({
    List<GoRoute>? routes,
    String? initialLocation,
    VoidCallback? onRouteErrorAction,
    PageArguments? initialExtra,
  }) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    final appRoutes = routes ?? _appRoutes;
    final router = GoRouter(
      routes: appRoutes,
      initialLocation: initialLocation ?? _initialRoute,
      initialExtra: initialExtra,
      debugLogDiagnostics: true,
      errorBuilder: (_, __) {
        return RedirectError(action: onRouteErrorAction);
      },
      refreshListenable: _routerNotifier,
    );
    appRouter = router;
    return router;
  }
}

@visibleForTesting
class RedirectError extends StatefulWidget {
  final VoidCallback? action;

  const RedirectError({this.action, super.key});

  @override
  State<RedirectError> createState() => _RedirectErrorState();
}

class _RedirectErrorState extends State<RedirectError> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(
      Duration.zero,
      widget.action ??
          () {
            context.push(AppRouter._initialRoute);
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

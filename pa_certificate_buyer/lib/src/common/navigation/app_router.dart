import 'package:common/common_navigation_export.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pa_certificate_buyer/src/common/di/injector.dart';
import 'package:pa_certificate_buyer/src/common/navigation/routes.dart';
import 'package:pa_certificate_buyer/src/feature/certificate_buyer_page/pages/certificate_buyer_page.dart';


abstract final class AppRouter {
  static final _initialRoute = Routes.certificateBuyerPath.route;

  static late GoRouter appRouter;

  // Here we will pass MainSearchArgs.
  // ignore: unused_field
  static final _initialExtra = UnimplementedError();
  static final _routerNotifier = RouterNotifier();
  static final _i = i;

  static final _appRoutes = <RouteBase>[
    CrmRouteBuilder<CertificateBuyerPage>(
      i: _i,
      routeConfig: Routes.certificateBuyerPath,
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

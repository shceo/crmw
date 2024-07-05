import 'package:common/common_navigation_export.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mod_reserve/src/common/di/injector.dart';
import 'package:mod_reserve/src/common/navigation/routes.dart';
import 'package:mod_reserve/src/features/answer_accepted_page/pages/answer_accepted_page.dart';
import 'package:mod_reserve/src/features/basket_page/pages/basket_page.dart';
import 'package:mod_reserve/src/features/check_reserve_notification_page/pages/check_reserve_notification_page.dart';
import 'package:mod_reserve/src/features/confirm_reserve_page/pages/confirm_reserve_page.dart';
import 'package:mod_reserve/src/features/contact_support_page/pages/contact_support_page.dart';
import 'package:mod_reserve/src/features/detail_event_page/pages/detail_event_page.dart';
import 'package:mod_reserve/src/features/edit_contact_page/pages/edit_contact_page.dart';
import 'package:mod_reserve/src/features/enter_contact_page/pages/enter_contact_page.dart';
import 'package:mod_reserve/src/features/search_event_page/pages/search_event_page.dart';
import 'package:mod_reserve/src/features/thanksgiving_page/pages/thanksgiving_page.dart';

abstract final class AppRouter {
  static final _initialRoute = Routes.searchEventPath.route;

  static late GoRouter appRouter;

  // Here we will pass MainSearchArgs.
  // ignore: unused_field
  static final _initialExtra = UnimplementedError();
  static final _routerNotifier = RouterNotifier();
  static final _i = i;

  static final _appRoutes = <RouteBase>[
    CrmRouteBuilder<SearchEventPage>(
      i: _i,
      routeConfig: Routes.searchEventPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<ConfirmReservePage>(
      i: _i,
      routeConfig: Routes.confirmReservePath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<EditContactPage>(
      i: _i,
      routeConfig: Routes.editContactPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<CheckReserveNotificationPage>(
      i: _i,
      routeConfig: Routes.checkReserveNotificationPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<ContactSupportPage>(
      i: _i,
      routeConfig: Routes.contactSupportPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<AnswerAcceptedPage>(
      i: _i,
      routeConfig: Routes.answerAcceptedPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<ThanksgivingPage>(
      i: _i,
      routeConfig: Routes.thanksgivingPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<EnterContactPage>(
      i: _i,
      routeConfig: Routes.enterContactPath,
    ).buildTransparentRoute(),
    CrmRouteBuilder<BasketPage>(
      i: _i,
      routeConfig: Routes.basketPath,
    ).buildTransparentRoute(),
    CrmRouteWithParamBuilder<DetailEventPage, DetailEventArguments>(
      i: _i,
      routeConfig: Routes.detailEventPath,
      getFirstParams: (state) {
        final categoryId = state.pathParameters['category_id'];
        final programmeId = state.pathParameters['programme_id'];
        final addressId = state.pathParameters['address_id'];
        final categoryName = state.pathParameters['category_name'];

        return state.extra as DetailEventArguments? ??
            DetailEventArguments(
              categoryId: int.parse(categoryId!),
              programmeId: int.parse(programmeId!),
              addressId: int.parse(addressId!),
              categoryName: categoryName!,
            );
      },
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

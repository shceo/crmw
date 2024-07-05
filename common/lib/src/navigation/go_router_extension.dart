import 'package:common/src/navigation/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterContextExtension on BuildContext {
  void navigateTo(CustomRoute route) {
    if (route.type == RouteType.pop) {
      pop();
    } else {
      final pageConfig = route.pageConfig;
      if (pageConfig != null) {
        if (route.shouldClearStack) {
          goNamed(
            pageConfig.path,
            extra: pageConfig.args,
            pathParameters: pageConfig.pathParameters ?? {},
          );
        } else {
          if (route.shouldReplace) {
            replaceNamed(
              pageConfig.path,
              extra: pageConfig.args,
              pathParameters: pageConfig.pathParameters ?? {},
            );
          } else {
            pushNamed(
              pageConfig.path,
              extra: pageConfig.args,
              pathParameters: pageConfig.pathParameters ?? {},
            );
          }
        }
      }
    }
  }
}

extension GoRouterObjectExtension on GoRouter {
  Future<Object?> navigateTo(
    CustomRoute route, {
    VoidCallback? whenComplete,
    Object? popParam,
  }) async {
    if (route.type == RouteType.pop) {
      pop(popParam);
    } else {
      final pageConfig = route.pageConfig;
      if (pageConfig != null) {
        if (route.shouldClearStack) {
          goNamed(
            pageConfig.path,
            extra: pageConfig.args,
            pathParameters: pageConfig.pathParameters ?? {},
          );
        } else {
          if (route.shouldReplace) {
            replaceNamed(
              pageConfig.path,
              extra: pageConfig.args,
              pathParameters: pageConfig.pathParameters ?? {},
            );
          } else {
            pushNamed(
              pageConfig.path,
              extra: pageConfig.args,
              pathParameters: pageConfig.pathParameters ?? {},
            ).whenComplete(() => whenComplete?.call());
          }
        }
      }
    }

    return popParam;
  }
}

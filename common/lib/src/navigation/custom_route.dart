import 'package:common/src/navigation/page_configuration.dart';
import 'package:equatable/equatable.dart';

class CustomRoute extends Equatable {
  final RouteType? type;
  final PageConfiguration? pageConfig;
  final bool shouldReplace;
  final bool shouldClearStack;

  @override
  List<Object?> get props => [
    type,
    pageConfig,
    shouldReplace,
    shouldClearStack,
  ];

  const CustomRoute(
      this.type,
      this.pageConfig, {
        this.shouldReplace = false,
        this.shouldClearStack = false,
      });

  const CustomRoute.pop() : this(RouteType.pop, null);

  bool isPop() => type == RouteType.pop;
}

enum RouteType { pop, navigateTo }

import 'package:common/common_navigation_export.dart';

enum Routes implements BaseRoutes {
  signInPath('/sign-in-page');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}

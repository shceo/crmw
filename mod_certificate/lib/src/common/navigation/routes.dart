import 'package:common/common_navigation_export.dart';

enum Routes implements BaseRoutes {
  searchEventPath('/search-event-page');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}

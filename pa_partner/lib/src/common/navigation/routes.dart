import 'package:common/common_navigation_export.dart';

enum Routes implements BaseRoutes {
  mainPath('/'),

  blocksPath('/blocks-page'),

  addBlockPath('/add-block-page'),

  addShutdownPath('/add-shutdown-page'),

  signInPath('/sign-in-page');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}

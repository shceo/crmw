import 'package:common/common_navigation_export.dart';
import 'package:pa_partner/src/common/navigation/routes.dart';

PageConfiguration mainConfig() {
  return PageConfiguration(path: Routes.mainPath.name);
}

PageConfiguration blocksConfig() {
  return PageConfiguration(path: Routes.blocksPath.name);
}

PageConfiguration addBlockConfig() {
  return PageConfiguration(path: Routes.addBlockPath.name);
}

PageConfiguration addShutdownConfig() {
  return PageConfiguration(path: Routes.addShutdownPath.name);
}

PageConfiguration signInConfig() {
  return PageConfiguration(path: Routes.signInPath.name);
}

// PageConfiguration examplePageWithArgumentsConfig({
//   required String arg1,
//   required String arg2,
// }) {
//   return PageConfiguration(
//     path: Routes.examplePageWithArgumentsPath.name,
//     args: ExamplePageWithArguments(
//       arg1: arg1,
//       arg2: arg2,
//     ),
//   );
// }

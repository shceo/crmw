import 'package:common/common_navigation_export.dart';
import 'package:pa_customer/src/common/navigation/routes.dart';

PageConfiguration reserveConfig() {
  return PageConfiguration(path: Routes.reservePath.name);
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

import 'package:common/common_navigation_export.dart';
import 'package:pa_certificate/src/common/navigation/routes.dart';

PageConfiguration signInConfig() {
  return PageConfiguration(path: Routes.signInPath.name);
}

PageConfiguration certificateConfig() {
  return PageConfiguration(path: Routes.certificatePath.name);
}

PageConfiguration enterOtpConfig() {
  return PageConfiguration(path: Routes.enterOtpPath.name);
}

PageConfiguration giftCertificateConfig() {
  return PageConfiguration(path: Routes.giftCertificatePath.name);
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

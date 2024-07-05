import 'package:common/common_navigation_export.dart';

enum Routes implements BaseRoutes {
  signInPath('/sign-in-page'),
  certificatePath('/certificate-page'),
  enterOtpPath('/enter-otp-page'),
  giftCertificatePath('/gift-certificate-page'),
  ;

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}

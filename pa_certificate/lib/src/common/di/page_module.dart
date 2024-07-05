import 'package:pa_certificate/src/common/di/injector.dart';
import 'package:pa_certificate/src/features/certificate_page/pages/certificate_page.dart';
import 'package:pa_certificate/src/features/enter_otp_page/pages/enter_otp_page.dart';
import 'package:pa_certificate/src/features/gift_certificate_page/pages/gift_certificate_page.dart';
import 'package:pa_certificate/src/features/sign_in_page/pages/sign_in_page.dart';

void initPages() {
  i
    ..registerFactory<SignInPage>(SignInPage.new)
    ..registerFactory<CertificatePage>(CertificatePage.new)
    ..registerFactory<EnterOtpPage>(EnterOtpPage.new)
    ..registerFactory<GiftCertificatePage>(GiftCertificatePage.new);
}

import 'package:pa_certificate_buyer/src/common/di/injector.dart';
import 'package:pa_certificate_buyer/src/feature/certificate_buyer_page/pages/certificate_buyer_page.dart';


void initPages() {
  i.registerFactory<CertificateBuyerPage>(CertificateBuyerPage.new);
}

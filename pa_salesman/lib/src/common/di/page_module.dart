import 'package:pa_salesman/src/common/di/injector.dart';
import 'package:pa_salesman/src/feature/sign_in_page/pages/sign_in_page.dart';

void initPages() {
  i.registerFactory<SignInPage>(SignInPage.new);
}

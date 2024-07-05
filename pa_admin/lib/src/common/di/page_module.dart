import 'package:pa_admin/src/common/di/injector.dart';
import 'package:pa_admin/src/features/sign_in_page/pages/sign_in_page.dart';

void initPages() {
  i.registerFactory<SignInPage>(SignInPage.new);
}

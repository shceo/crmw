import 'package:pa_customer/src/common/di/injector.dart';
import 'package:pa_customer/src/features/reserve_page/pages/reserve_page.dart';

void initPages() {
  i.registerFactory<ReservePage>(ReservePage.new);
}

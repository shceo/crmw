import 'package:mod_certificate/src/common/di/injector.dart';
import 'package:mod_certificate/src/features/search_event_page/pages/search_event_page.dart';

void initPages() {
  i
    .registerFactory<SearchEventPage>(SearchEventPage.new);
}

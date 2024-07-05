import 'package:pa_partner/src/common/di/injector.dart';
import 'package:pa_partner/src/features/add_block_page/pages/add_block_page.dart';
import 'package:pa_partner/src/features/add_shutdown_page/pages/add_shutdown_page.dart';
import 'package:pa_partner/src/features/blocks_page/pages/blocks_page.dart';
import 'package:pa_partner/src/features/main/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:pa_partner/src/features/main/pages/main_page.dart';
import 'package:pa_partner/src/features/main/widgets/calendar_body/calendar_body.dart';
import 'package:pa_partner/src/features/sign_in_page/pages/sign_in_page.dart';

void initPages() {
  i
    ..registerFactory<MainPage>(MainPage.new)
    ..registerFactory<SignInPage>(SignInPage.new)
    ..registerFactory<AddBlockPage>(AddBlockPage.new)
    ..registerFactory<AddShutdownPage>(AddShutdownPage.new)
    ..registerFactory<BlocksPage>(BlocksPage.new)
    ..registerFactory<CalendarBody>(CalendarBody.new);
  
}

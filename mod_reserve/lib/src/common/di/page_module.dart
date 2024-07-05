import 'package:mod_reserve/src/common/di/injector.dart';
import 'package:mod_reserve/src/features/answer_accepted_page/pages/answer_accepted_page.dart';
import 'package:mod_reserve/src/features/basket_page/pages/basket_page.dart';
import 'package:mod_reserve/src/features/check_reserve_notification_page/pages/check_reserve_notification_page.dart';
import 'package:mod_reserve/src/features/confirm_reserve_page/pages/confirm_reserve_page.dart';
import 'package:mod_reserve/src/features/contact_support_page/pages/contact_support_page.dart';
import 'package:mod_reserve/src/features/detail_event_page/pages/detail_event_page.dart';
import 'package:mod_reserve/src/features/edit_contact_page/pages/edit_contact_page.dart';
import 'package:mod_reserve/src/features/enter_contact_page/pages/enter_contact_page.dart';
import 'package:mod_reserve/src/features/search_event_page/pages/search_event_page.dart';
import 'package:mod_reserve/src/features/thanksgiving_page/pages/thanksgiving_page.dart';

void initPages() {
  i
    ..registerFactory<SearchEventPage>(SearchEventPage.new)
    ..registerFactory<ConfirmReservePage>(ConfirmReservePage.new)
    ..registerFactory<EditContactPage>(EditContactPage.new)
    ..registerFactory<CheckReserveNotificationPage>(
      CheckReserveNotificationPage.new,
    )
    ..registerFactory<ContactSupportPage>(ContactSupportPage.new)
    ..registerFactory<AnswerAcceptedPage>(AnswerAcceptedPage.new)
    ..registerFactory<ThanksgivingPage>(ThanksgivingPage.new)
    ..registerFactory<EnterContactPage>(EnterContactPage.new)
    ..registerFactory<BasketPage>(BasketPage.new)
    ..registerFactoryParam<DetailEventPage, DetailEventArguments, void>(
      (args, _) => DetailEventPage(
        categoryId: args.categoryId,
        programmeId: args.programmeId,
        addressId: args.addressId,
        categoryName: args.categoryName,
      ),
    );
}

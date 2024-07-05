import 'package:common/common_navigation_export.dart';

enum Routes implements BaseRoutes {
  searchEventPath('/search-event-page'),
  confirmReservePath('/confirm-reserve-page'),
  editContactPath('/edit-contact-page'),
  checkReserveNotificationPath('/check-reserve-notification-page'),
  contactSupportPath('/contact-support-page'),
  answerAcceptedPath('/answer-accepted-page'),
  thanksgivingPath('/thanksgiving-page'),
  enterContactPath('/enter-contact-page'),
  basketPath('/basket-page'),
  detailEventPath('/detail-event-page/:category_id/:programme_id/:address_id/:category_name'),
  ;

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}

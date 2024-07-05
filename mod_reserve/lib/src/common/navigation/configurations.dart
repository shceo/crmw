import 'package:common/common_navigation_export.dart';
import 'package:mod_reserve/src/common/navigation/routes.dart';
import 'package:mod_reserve/src/features/detail_event_page/pages/detail_event_page.dart';

PageConfiguration searchEventConfig() {
  return PageConfiguration(path: Routes.searchEventPath.name);
}

PageConfiguration confirmReserveConfig() {
  return PageConfiguration(path: Routes.confirmReservePath.name);
}

PageConfiguration editContactConfig() {
  return PageConfiguration(path: Routes.editContactPath.name);
}

PageConfiguration checkReserveNotificationConfig() {
  return PageConfiguration(path: Routes.checkReserveNotificationPath.name);
}

PageConfiguration contactSupportConfig() {
  return PageConfiguration(path: Routes.contactSupportPath.name);
}

PageConfiguration answerAcceptedConfig() {
  return PageConfiguration(path: Routes.answerAcceptedPath.name);
}

PageConfiguration thanksgivingConfig() {
  return PageConfiguration(path: Routes.thanksgivingPath.name);
}

PageConfiguration enterContactConfig() {
  return PageConfiguration(path: Routes.enterContactPath.name);
}

PageConfiguration basketConfig() {
  return PageConfiguration(path: Routes.basketPath.name);
}

PageConfiguration detailEventConfig({
  required int categoryId,
  required int programmeId,
  required int addressId,
  required String categoryName,
  required Map<String, String> pathParameters,
}) {
  return PageConfiguration(
    path: Routes.detailEventPath.name,
    args: DetailEventArguments(
      categoryId: categoryId,
      programmeId: programmeId,
      addressId: addressId,
      categoryName: categoryName,
    ),
    pathParameters: pathParameters,
  );
}


// PageConfiguration examplePageWithArgumentsConfig({
//   required String arg1,
//   required String arg2,
// }) {
//   return PageConfiguration(
//     path: Routes.examplePageWithArgumentsPath.name,
//     args: ExamplePageWithArguments(
//       arg1: arg1,
//       arg2: arg2,
//     ),
//   );
// }

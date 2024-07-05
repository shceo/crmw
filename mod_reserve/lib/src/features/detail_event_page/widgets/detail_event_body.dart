import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:core/domain/entities/brand_service_date/brand_service_date.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_denomination.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_exact_duration.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot.dart';
import 'package:flutter/material.dart';
import 'package:mod_reserve/src/features/detail_event_page/cubit/detail_event_cubit.dart';
import 'package:mod_reserve/src/features/detail_event_page/widgets/detail_background_widget.dart';
import 'package:mod_reserve/src/features/detail_event_page/widgets/select_hour_slot.dart';
import 'package:mod_reserve/src/features/detail_event_page/widgets/select_item_slot.dart';
import 'package:mod_reserve/src/features/detail_event_page/widgets/time_slot_item.dart';

class DetailEventBody extends StatefulWidget {
  final DetailEventCubit detailEventCubit;
  final int categoryId;
  final int programmeId;
  final String categoryName;
  final List<BrandServiceDetailProgramme>? brandServiceDetailProgramme;
  final BrandServiceProgramExactDuration? currentProgramDuration;
  final List<BrandServiceDenomination>? brandServiceDenomination;
  final List<BrandServiceDate>? brandServiceDate;
  final List<BrandServiceTimeSlot> brandServiceTimeSlot;
  final String selectedDateTime;
  final VoidCallback onBackButtonTap;
  final VoidCallback onTap;
  const DetailEventBody({
    required this.detailEventCubit,
    required this.categoryId,
    required this.programmeId,
    required this.categoryName,
    required this.brandServiceDetailProgramme,
    required this.brandServiceDenomination,
    required this.brandServiceDate,
    required this.brandServiceTimeSlot,
    required this.selectedDateTime,
    required this.currentProgramDuration,
    required this.onBackButtonTap,
    required this.onTap,
    super.key,
  });

  @override
  State<DetailEventBody> createState() => _DetailEventBodyState();
}

class _DetailEventBodyState extends State<DetailEventBody> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Stack(
          children: [
            DetailBackgroundWidget(
              brandServiceDetailProgramme: widget.brandServiceDetailProgramme,
              onBackButtonTap: widget.onBackButtonTap,
              pageController: pageController,
            ),
            Positioned(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: (context.deviceHeight / 2) - 30,
                    ),
                    _BottomSheetContent(
                      children: [
                        Text(
                          widget.brandServiceDetailProgramme!.first.name,
                          style: context.themeData.textTheme.displayLarge
                              ?.copyWith(
                            fontWeight: CommonFonts.semiBold,
                          ),
                        ),
                        const SizedBox(height: CommonDimensions.large),
                        Text(
                          widget.categoryName,
                          style: context.themeData.textTheme.headlineLarge
                              ?.copyWith(
                            fontWeight: CommonFonts.semiBold,
                          ),
                        ),
                        const SizedBox(height: CommonDimensions.medium),
                        Text(
                          widget.brandServiceDetailProgramme!.first.description,
                          style: context.themeData.textTheme.headlineSmall
                              ?.copyWith(
                            color: context.theme.secondaryTextColor,
                            fontWeight: CommonFonts.regular,
                          ),
                        ),
                        const SizedBox(height: CommonDimensions.extraLarge),
                        SelectHourSlot(
                          detailEventCubit: widget.detailEventCubit,
                          programExactDuration: widget
                              .brandServiceDetailProgramme!
                              .first
                              .brandServiceProgramExactDuration,
                          currentProgramDuration: widget.currentProgramDuration,
                          onDurationChanged: (duration) =>
                              widget.detailEventCubit
                                ..updateCurrentProgramDuration(duration)
                                ..getBrandServiceDenomination(
                                  programmeExactItemId: duration.id,
                                ),
                        ),
                        const SizedBox(height: CommonDimensions.extraLarge),
                        SelectItemSlot(
                          brandServiceDenomination:
                              widget.brandServiceDenomination,
                          counterCallback: (map) => widget.detailEventCubit
                              .updateTimeSlotVariant(map),
                        ),
                        const SizedBox(height: CommonDimensions.extraLarge),
                        CustomRowCalendar(
                          brandServiceDate: widget.brandServiceDate,
                          selectedDateTime: widget.selectedDateTime,
                          onChanged: (date) =>
                              widget.detailEventCubit.updateSelectedDate(
                            date.date,
                          ),
                        ),
                        const SizedBox(height: CommonDimensions.extraLarge),
                        for (final timeSlot in widget.brandServiceTimeSlot)
                          TimeSlotItem(
                            timeSlot: timeSlot,
                            status: TimeSlotStatus.available,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  const _BottomSheetContent({
    required this.children,
    // ignore: unused_element
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.adaptiveDeviceWidth,
      padding: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.secondaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            CommonDimensions.extraLarge,
          ),
          topRight: Radius.circular(
            CommonDimensions.extraLarge,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(CommonDimensions.large),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}

// class _ShimmerContentLoading extends StatelessWidget {
//   const _ShimmerContentLoading();

//   @override
//   Widget build(BuildContext context) {
//     return _BottomSheetContent(
//       children: [
//         Shimmer(
//           gradient: LinearGradient(
//             colors: [
//               context.theme.mainColor.withOpacity(.3),
//               context.theme.mainColor,
//             ],
//           ),
//           child: Container(
//             color: context.theme.mainColor,
//             margin: const EdgeInsets.only(
//               right: CommonDimensions.multiLarge,
//             ),
//             width: context.deviceWidth,
//             height: 20,
//           ),
//         ),
//         const SizedBox(
//           height: CommonDimensions.large,
//         ),
//         Shimmer(
//           gradient: LinearGradient(
//             colors: [
//               context.theme.mainColor.withOpacity(.3),
//               context.theme.mainColor,
//             ],
//           ),
//           child: Container(
//             color: context.theme.mainColor,
//             margin: const EdgeInsets.only(
//               right: CommonDimensions.megaLarge,
//             ),
//             width: context.deviceWidth,
//             height: 20,
//           ),
//         ),
//         const SizedBox(
//           height: CommonDimensions.large,
//         ),
//         Shimmer(
//           gradient: LinearGradient(
//             colors: [
//               context.theme.mainColor.withOpacity(.3),
//               context.theme.mainColor,
//             ],
//           ),
//           child: Container(
//             color: context.theme.mainColor,
//             margin: const EdgeInsets.only(
//               right: CommonDimensions.multiLarge,
//             ),
//             width: context.deviceWidth,
//             height: 20,
//           ),
//         ),
//         const SizedBox(
//           height: CommonDimensions.large,
//         ),
//         Shimmer(
//           gradient: LinearGradient(
//             colors: [
//               context.theme.mainColor.withOpacity(.3),
//               context.theme.mainColor,
//             ],
//           ),
//           child: Container(
//             color: context.theme.mainColor,
//             margin: const EdgeInsets.only(
//               right: CommonDimensions.megaLarge,
//             ),
//             width: context.deviceWidth,
//             height: 20,
//           ),
//         ),
//         const SizedBox(
//           height: CommonDimensions.large,
//         ),
//         Shimmer(
//           gradient: LinearGradient(
//             colors: [
//               context.theme.mainColor.withOpacity(.3),
//               context.theme.mainColor,
//             ],
//           ),
//           child: Container(
//             width: context.deviceWidth,
//             height: 240,
//             decoration: BoxDecoration(
//               color: context.theme.mainColor,
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(
//                   CommonDimensions.large,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

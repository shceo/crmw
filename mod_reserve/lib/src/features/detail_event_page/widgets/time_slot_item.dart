import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot.dart';
import 'package:core/domain/entities/brand_service_time_slot/brand_service_time_slot_variant.dart';
import 'package:flutter/material.dart';

class TimeSlotItem extends StatelessWidget {
  final BrandServiceTimeSlot timeSlot;
  final TimeSlotStatus status;
  const TimeSlotItem({
    required this.timeSlot,
    required this.status,
    super.key,
  });

  String calculatePrice(List<BrandServiceTimeSlotVariant> variants) {
    var price = 0;

    for (final element in variants) {
      if (element.price?.value != null) {
        price += element.price!.value;
      }
    }
    return '$price ${variants.first.price?.currency.symbol}';
  }

  Color getItemBackgroundColor(BuildContext context, TimeSlotStatus status) {
    return switch (status) {
      TimeSlotStatus.unavailable => context.theme.tertiaryColor,
      TimeSlotStatus.available => context.theme.mainColor.withOpacity(.2),
      TimeSlotStatus.selected => context.theme.mainColor,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        color: getItemBackgroundColor(context, status),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _TimeSlotIndicator(status: status),
              const SizedBox(width: CommonDimensions.medium),
              Text(
                // ignore: lines_longer_than_80_chars
                '${timeSlot.datetimeStart.toHHmm()} - ${timeSlot.datetimeEnd.toHHmm()}',
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.quaternaryTextColor,
                  fontSize: CommonFonts.sizeTitleMedium,
                  fontWeight: CommonFonts.regular,
                ),
              ),
            ],
          ),
          Text(
            calculatePrice(timeSlot.variants),
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontSize: CommonFonts.sizeTitleMedium,
              fontWeight: CommonFonts.regular,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeSlotIndicator extends StatelessWidget {
  final TimeSlotStatus status;
  const _TimeSlotIndicator({
    required this.status,
  });

  Color getFirstCircleColor(
    BuildContext context,
    TimeSlotStatus status,
  ) {
    return switch (status) {
      TimeSlotStatus.unavailable => context.theme.fiveFoldColor,
      TimeSlotStatus.available => context.theme.mainColor,
      TimeSlotStatus.selected => context.theme.secondaryColor,
    };
  }

  Color getSecondCircleColor(
    BuildContext context,
    TimeSlotStatus status,
  ) {
    return switch (status) {
      TimeSlotStatus.unavailable => context.theme.secondaryColor,
      TimeSlotStatus.available => context.theme.mainColor.withOpacity(.2),
      TimeSlotStatus.selected => context.theme.mainColor,
    };
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 7,
      backgroundColor: getFirstCircleColor(context, status),
      child: CircleAvatar(
        radius: 3,
        backgroundColor: getSecondCircleColor(context, status),
      ),
    );
  }
}

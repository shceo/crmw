import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:core/domain/entities/brand_service_date/brand_service_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class CustomRowCalendar extends StatefulWidget {
  final List<BrandServiceDate>? brandServiceDate;
  final String selectedDateTime;
  final Function(BrandServiceDate) onChanged;
  const CustomRowCalendar({
    required this.brandServiceDate,
    required this.selectedDateTime,
    required this.onChanged,
    super.key,
  });

  @override
  State<CustomRowCalendar> createState() => _CustomRowCalendarState();
}

class _CustomRowCalendarState extends State<CustomRowCalendar> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.brandServiceDate!.isEmpty) {
      return Shimmer.fromColors(
        baseColor: context.theme.quaternaryColor.withOpacity(.3),
        highlightColor: context.theme.quaternaryColor,
        child: Container(
          color: context.theme.quaternaryColor,
          height: CommonDimensions.rowCalendarHeight,
          width: context.adaptiveDeviceWidth,
        ),
      );
    }
    return SizedBox(
      height: CommonDimensions.rowCalendarHeight,
      width: context.adaptiveDeviceWidth,
      child: Row(
        children: [
          _SelectedDateInfoWidget(
            selectedDate: widget.selectedDateTime,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final date in widget.brandServiceDate!)
                    _CalendarItem(
                      brandServiceDate: date,
                      selectedDateTime: widget.selectedDateTime,
                      onTap: () => widget.onChanged(date),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectedDateInfoWidget extends StatelessWidget {
  final String selectedDate;

  const _SelectedDateInfoWidget({
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: CommonDimensions.large,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.extraLarge,
        vertical: CommonDimensions.large,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.tertiaryTextColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.medium,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selectedDate.toMMMMFormat(context).capitalize(),
            style: context.themeData.textTheme.headlineMedium,
          ),
          Text(
            selectedDate.toYyyyFormat(),
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontSize: CommonFonts.sizeTitleMedium,
              color: context.theme.secondaryTextColor,
              fontWeight: CommonFonts.medium,
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarItem extends StatelessWidget {
  final BrandServiceDate brandServiceDate;
  final String selectedDateTime;
  final VoidCallback onTap;
  const _CalendarItem({
    required this.brandServiceDate,
    required this.selectedDateTime,
    required this.onTap,
  });

  String weekDayCalculation(int day) {
    return switch (day) {
      0 => 'Пн',
      1 => 'Вт',
      2 => 'Ср',
      3 => 'Чт',
      4 => 'Пт',
      _ => throw UnimplementedError(),
    };
  }

  String calculateDay(String date) {
    final parse = DateTime.parse(date);

    final dateDay = DateFormat('dd').format(parse);
    return dateDay;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CommonDimensions.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              weekDayCalculation(brandServiceDate.day),
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.secondaryTextColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: CommonDimensions.large,
                vertical: CommonDimensions.mediumLarge,
              ),
              // margin: const EdgeInsets.only(right: CommonDimensions.large),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: brandServiceDate.date == selectedDateTime
                    ? context.theme.mainColor
                    : context.theme.secondaryColor,
                borderRadius: BorderRadius.circular(
                  CommonDimensions.medium,
                ),
                border: brandServiceDate.date == selectedDateTime
                    ? null
                    : Border.all(
                        color: context.theme.quaternaryColor,
                      ),
              ),
              child: Text(
                calculateDay(brandServiceDate.date),
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: brandServiceDate.date == selectedDateTime
                      ? context.theme.quaternaryTextColor
                      : context.theme.primaryTextColor,
                  fontWeight: CommonFonts.semiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

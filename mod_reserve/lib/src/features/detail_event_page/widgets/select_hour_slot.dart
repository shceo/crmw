import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_exact_duration.dart';
import 'package:flutter/cupertino.dart';
import 'package:mod_reserve/src/features/detail_event_page/cubit/detail_event_cubit.dart';

class SelectHourSlot extends StatelessWidget {
  final DetailEventCubit detailEventCubit;
  final List<BrandServiceProgramExactDuration> programExactDuration;
  final BrandServiceProgramExactDuration? currentProgramDuration;
  final Function(BrandServiceProgramExactDuration)? onDurationChanged;

  const SelectHourSlot({
    required this.detailEventCubit,
    required this.programExactDuration,
    required this.currentProgramDuration,
    required this.onDurationChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Выберите слот',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: CommonFonts.medium,
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        Text(
          'Выберите колличество часов',
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final duration in programExactDuration)
              GestureDetector(
                onTap: () {
                  if (onDurationChanged != null) {
                    // ignore: prefer_null_aware_method_calls
                    onDurationChanged!(duration);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(CommonDimensions.medium),
                  decoration: BoxDecoration(
                    color: duration == currentProgramDuration
                        ? context.theme.mainColor
                        : context.theme.mainColor.withOpacity(.2),
                    border: duration == currentProgramDuration
                        ? null
                        : Border.all(
                            color: context.theme.mainColor,
                          ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        CommonDimensions.large,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // ignore: lines_longer_than_80_chars
                        'от ${duration.brandServicePriceDefault.value} ${duration.brandServicePriceDefault.brandServiceCurrency.symbol}',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: duration == currentProgramDuration
                              ? context.theme.quaternaryTextColor
                              : context.theme.tertiaryTextColor,
                          fontWeight: CommonFonts.regular,
                        ),
                      ),
                      Text(
                        '${duration.brandServiceProgramDuration.unit} час',
                        style:
                            context.themeData.textTheme.headlineLarge?.copyWith(
                          color: duration == currentProgramDuration
                              ? context.theme.quaternaryTextColor
                              : context.theme.primaryTextColor,
                          fontWeight: CommonFonts.medium,
                        ),
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

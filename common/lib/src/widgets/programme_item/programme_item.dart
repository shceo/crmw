import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_program_exact_duration.dart';
import 'package:flutter/material.dart';

class ProgrammeItem extends StatelessWidget {
  final String assetPath;
  final String title;
  final String description;
  final VoidCallback onTap;
  final List<BrandServiceProgramExactDuration> programmeDurationList;
  final String? announcementText;

  const ProgrammeItem({
    required this.assetPath,
    required this.title,
    required this.description,
    required this.onTap,
    required this.programmeDurationList,
    this.announcementText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: CommonDimensions.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProgrammeImage(
            assetPath: assetPath,
            programmeDurationList: programmeDurationList,
            announcementText: announcementText,
          ),
          _MultiDurationProgrammeItem(
            programmeDurationList: programmeDurationList,
          ),
          const SizedBox(height: CommonDimensions.medium),
          Text(
            title,
            style: context.themeData.textTheme.headlineMedium,
          ),
          const SizedBox(height: CommonDimensions.medium),
          Text(
            description,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: CommonFonts.medium,
              color: context.theme.secondaryTextColor,
            ),
          ),
          const SizedBox(height: CommonDimensions.large),
          CustomButton.text(
            text: context.locale.select,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _ProgrammeImage extends StatelessWidget {
  final String assetPath;
  final List<BrandServiceProgramExactDuration> programmeDurationList;
  final String? announcementText;

  const _ProgrammeImage({
    required this.assetPath,
    required this.programmeDurationList,
    required this.announcementText,
  });

  @override
  Widget build(BuildContext context) {
    final programmePrice =
        programmeDurationList[0].brandServicePriceDefault.value;
    final programmeSymbol = programmeDurationList[0]
        .brandServicePriceDefault
        .brandServiceCurrency
        .symbol;
    final programmeTimeUnit =
        programmeDurationList[0].brandServiceProgramDuration.unit;

    return SizedBox(
      width: context.deviceWidth,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.large,
              ),
            ),
            child: Image.network(
              assetPath,
              fit: BoxFit.cover,
              width: context.deviceWidth,
              height: CommonDimensions.categoryAssetsHeight,
            ),
          ),
          if (programmeDurationList.length == 1)
            _SingleDurationProgrammeItem(
              price:
                  '$programmeTimeUnit час от $programmePrice $programmeSymbol',
            ),
          if (announcementText != null)
            _AnnouncementWidget(announcementText: announcementText),
        ],
      ),
    );
  }
}

class _MultiDurationProgrammeItem extends StatelessWidget {
  final List<BrandServiceProgramExactDuration> programmeDurationList;
  const _MultiDurationProgrammeItem({
    required this.programmeDurationList,
  });

  @override
  Widget build(BuildContext context) {
    if (programmeDurationList.length > 1) {
      if (context.deviceWidth > CommonDimensions.minDurationProgramWidth) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final programmeDuration in programmeDurationList)
              _MultiDurationProgrammePriceItem(
                price:
                    // ignore: lines_longer_than_80_chars
                    '${programmeDuration.brandServiceProgramDuration.unit} час от ${programmeDuration.brandServicePriceDefault.value} ${programmeDuration.brandServicePriceDefault.brandServiceCurrency.symbol}',
              ),
          ],
        );
      } else {
        return Center(
          child: Column(
            children: [
              for (final programmeDuration in programmeDurationList)
                _MultiDurationProgrammePriceItem(
                  price:
                      // ignore: lines_longer_than_80_chars
                      '${programmeDuration.brandServiceProgramDuration.unit} час от ${programmeDuration.brandServicePriceDefault.value} ${programmeDuration.brandServicePriceDefault.brandServiceCurrency.symbol}',
                  isInColumn: true,
                ),
            ],
          ),
        );
      }
    }

    return const SizedBox.shrink();
  }
}

class _SingleDurationProgrammeItem extends StatelessWidget {
  final String price;
  const _SingleDurationProgrammeItem({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: CommonDimensions.medium,
        left: CommonDimensions.superLarge,
      ),
      decoration: BoxDecoration(
        color: context.theme.mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CommonDimensions.large),
          bottomLeft: Radius.circular(CommonDimensions.large),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: CommonDimensions.medium),
          Text(
            price,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.quaternaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnnouncementWidget extends StatelessWidget {
  final String? announcementText;

  const _AnnouncementWidget({
    required this.announcementText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.large,
        vertical: CommonDimensions.medium,
      ),
      decoration: BoxDecoration(
        color: context.theme.mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CommonDimensions.large),
          topRight: Radius.circular(CommonDimensions.large),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              announcementText!,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.quaternaryTextColor,
                fontWeight: CommonFonts.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MultiDurationProgrammePriceItem extends StatelessWidget {
  final String price;
  final bool isInColumn;
  const _MultiDurationProgrammePriceItem({
    required this.price,
    this.isInColumn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isInColumn == true ? context.deviceWidth : null,
      margin: const EdgeInsets.only(top: CommonDimensions.medium),
      padding: const EdgeInsets.symmetric(
        vertical: CommonDimensions.medium,
        horizontal: CommonDimensions.large,
      ),
      decoration: BoxDecoration(
        color: context.theme.mainColor.withOpacity(.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.medium,
          ),
        ),
      ),
      child: Text(
        price,
        style: context.themeData.textTheme.headlineSmall?.copyWith(
          color: context.theme.tertiaryTextColor,
        ),
      ),
    );
  }
}

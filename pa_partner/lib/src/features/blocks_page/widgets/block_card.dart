import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class BlockCard extends StatelessWidget {
  const BlockCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: CommonDimensions.extraLarge,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CommonDimensions.large),
        color: context.theme.elevenFoldColor,
      ),
      width: context.adaptiveDeviceWidth,
      padding: const EdgeInsets.all(
        CommonDimensions.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.theme.redColor,
              borderRadius: BorderRadius.circular(CommonDimensions.large),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: CommonDimensions.small,
              horizontal: CommonDimensions.medium,
            ),
            child: Text(
              // TODO(dev): model data
              '2 квадроцикла сломалось',
              style: context.themeData.textTheme.titleMedium?.copyWith(
                color: context.theme.quaternaryTextColor,
              ),
            ),
          ),
          const SizedBox(
            height: CommonDimensions.mediumLarge,
          ),
          Text(
            // TODO(dev): model data
            'с 03.08.2022 15:00 до 08.08.2022 15:00',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: CommonFonts.regular,
              color: ThemeProvider.of(context).theme.tertiaryTextColor,
            ),
          ),
          const SizedBox(
            height: CommonDimensions.medium,
          ),
          Text(
            // TODO(dev): model data
            'Ресурс: CFmoto 500 - 2 шт.',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: CommonFonts.regular,
              color: context.theme.eightFoldColor,
            ),
          ),
          Text(
            // TODO(dev): model data
            'Адрес: Томск, ул. кирова 10',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: CommonFonts.regular,
              color: context.theme.eightFoldColor,
            ),
          ),
          const SizedBox(
            height: CommonDimensions.mediumLarge,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {},
                  // TODO(dev): localization
                  text: 'Остановить',
                  appAsset: CommonAssets.pauseIcon,
                  assetColor: context.theme.nineFoldColor,
                  textStyle: context.themeData.textTheme.titleMedium?.copyWith(
                    color: context.theme.nineFoldColor,
                  ),
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      CommonDimensions.small,
                    ),
                    color: ThemeProvider.of(context).theme.secondaryColor,
                    border: Border.all(
                      color: context.theme.sevenFoldColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: CommonDimensions.medium,
              ),
              Expanded(
                child: CustomButton.text(
                  onTap: () {},
                  // TODO(dev): localization
                  text: 'Изменить',
                  textStyle: context.themeData.textTheme.titleMedium?.copyWith(
                    color: context.theme.mainColor,
                  ),
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      CommonDimensions.small,
                    ),
                    color: context.theme.sixFoldColor,
                    border: Border.all(
                      color: context.theme.tenFoldColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

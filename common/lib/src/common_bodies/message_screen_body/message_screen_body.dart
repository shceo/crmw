import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageScreenBody extends StatelessWidget {
  final String? title;
  final String? subtitle;

  /// [actionTitle] is text on the button
  final String? actionTitle;
  final VoidCallback? onTap;
  const MessageScreenBody({
    this.title,
    this.subtitle,
    this.actionTitle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: context.deviceHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomVectorImage(
                svgAssetPath: CommonAssets.imagesIcon,
              ),
              const SizedBox(height: CommonDimensions.large),
              if (title != null)
                Text(
                  title!,
                  style: context.themeData.textTheme.displayLarge?.copyWith(
                    fontWeight: CommonFonts.semiBold,
                  ),
                ),
              const SizedBox(height: CommonDimensions.medium),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.secondaryTextColor,
                    fontWeight: CommonFonts.regular,
                  ),
                ),
              const SizedBox(height: CommonDimensions.extraLarge),
              if (onTap != null)
                CustomButton(
                  text: actionTitle,
                  textStyle:
                      context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.quaternaryTextColor,
                    fontWeight: CommonFonts.semiBold,
                  ),
                  appAsset: CommonAssets.smileIcon,
                  assetColor: context.theme.secondaryColor,
                  onTap: () => onTap,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class ContentInfo extends StatelessWidget {
  /// {color} is used for background , border and text color
  final Color color;
  final String? assetPath;
  final String? title;
  final String? subtitle;

  const ContentInfo({
    required this.color,
    this.assetPath,
    this.title,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        color: color.withOpacity(.2),
        border: Border.all(
          color: color.withOpacity(.3),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
      ),
      child: Row(
        children: [
          if (assetPath != null)
            CustomVectorImage(
              svgAssetPath: assetPath!,
            ),
          const SizedBox(width: CommonDimensions.large),
          if (title != null && subtitle == null)
            Text(
              title!,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: CommonFonts.semiBold,
              ),
            ),
          if (title != null && subtitle != null)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      color: color,
                      fontWeight: CommonFonts.semiBold,
                    ),
                  ),
                  const SizedBox(height: CommonDimensions.small),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: CommonDimensions.medium,
                    ),
                    child: Text(
                      subtitle!,
                      style:
                          context.themeData.textTheme.headlineSmall?.copyWith(
                        color: color,
                        fontWeight: CommonFonts.regular,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

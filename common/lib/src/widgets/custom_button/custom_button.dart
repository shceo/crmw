import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/src/widgets/custom_vector_image/custom_vector_image.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final String? appAsset;
  final Color? backgroundColor;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final Color? assetColor;

  const CustomButton({
    required this.onTap,
    required this.text,
    required this.appAsset,
    this.backgroundColor,
    this.boxDecoration,
    this.textStyle,
    this.assetColor,
    super.key,
  });

  const CustomButton.text({
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.boxDecoration,
    this.textStyle,
    super.key,
  })  : appAsset = null,
        assetColor = null;

  const CustomButton.icon({
    required this.onTap,
    this.backgroundColor,
    this.appAsset,
    this.boxDecoration,
    this.textStyle,
    this.assetColor,
    super.key,
  }) : text = null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(CommonDimensions.large),
              decoration: boxDecoration ??
                  BoxDecoration(
                    color: backgroundColor ?? context.theme.mainColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        CommonDimensions.large,
                      ),
                    ),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (appAsset != null)
                    CustomVectorImage(
                      svgAssetPath: appAsset!,
                      color: assetColor ?? context.theme.defaultIconColor,
                    ),
                  if (appAsset != null || text != null)
                    const SizedBox(
                      width: CommonDimensions.medium,
                    ),
                  if (text != null)
                    Text(
                      text!,
                      style: textStyle ??
                          context.themeData.textTheme.headlineMedium?.copyWith(
                            color: context.theme.quaternaryTextColor,
                          ),
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

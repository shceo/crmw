import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class CustomVectorImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final String svgAssetPath;
  final WidgetBuilder? placeholderBuilder;
  final bool matchTextDirection;
  final bool canDrawOutsideViewBox;
  final String? semanticsLabel;
  final bool excludeFromSemantics;
  final Clip clipBehavior;
  final bool cacheColorFilter;
  final SvgTheme theme;
  final Color? color;
  final ColorFilter? colorFilter;
  final AssetBundle? bundle;
  final String? package;

  const CustomVectorImage({
    required this.svgAssetPath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.matchTextDirection = false,
    this.canDrawOutsideViewBox = false,
    this.placeholderBuilder,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.clipBehavior = Clip.hardEdge,
    this.cacheColorFilter = false,
    this.theme = const SvgTheme(),
    this.color,
    this.colorFilter,
    this.bundle,
    this.package,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssetPath,
      width: width,
      height: height,
      fit: fit,
      // ignore: deprecated_member_use
      color: color,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
      allowDrawingOutsideViewBox: canDrawOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : colorFilter,
      bundle: bundle,
      package: package,
    );
  }
}

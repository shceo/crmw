import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final String? svgAssetPath;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const CustomAppBar({
    this.onTap,
    this.title,
    this.svgAssetPath,
    this.backgroundColor,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: CommonDimensions.none,
      toolbarHeight: CommonDimensions.cToolbarHeight,
      surfaceTintColor: context.theme.transparent,
      backgroundColor: widget.backgroundColor ?? context.theme.secondaryColor,
      leadingWidth: widget.svgAssetPath == null ? CommonDimensions.none : null,
      leading: widget.svgAssetPath == null
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(CommonDimensions.small),
              child: CustomVectorButton(
                onPressed: widget.onTap ?? () {},
                assetPath: widget.svgAssetPath!,
              ),
            ),
      title: Text(
        widget.title ?? '',
        style: context.themeData.textTheme.displaySmall?.copyWith(
          color: context.theme.primaryTextColor,
          fontWeight: CommonFonts.regular,
        ),
      ),
      centerTitle: true, // тст
    );
  }
}

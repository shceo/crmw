import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final CustomAppBar? appBar;
  final Color? backgroundColor;
  final CustomNavigationBar? bottomAppBar;
  const BasePage({
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.bottomAppBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.secondaryColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final contentWidth = maxWidth > CommonDimensions.maxPhoneWidth
              ? CommonDimensions.maxPhoneWidth
              : maxWidth;

          return Center(
            child: Container(
              color: backgroundColor ?? context.theme.secondaryColor,
              width: contentWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (appBar != null) appBar!,
                  Expanded(
                    child: body,
                  ),
                  if (bottomAppBar != null) bottomAppBar!,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

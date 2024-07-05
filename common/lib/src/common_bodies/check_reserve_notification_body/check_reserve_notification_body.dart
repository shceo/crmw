import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class CheckReserveNotificationBody extends StatelessWidget {
  final VoidCallback onNotificationArrivedTap;
  final VoidCallback onNotificationDidntArrivedTap;
  const CheckReserveNotificationBody({
    required this.onNotificationArrivedTap,
    required this.onNotificationDidntArrivedTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        Text(
          context.locale.didReceiveNotification,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontWeight: CommonFonts.semiBold,
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        Text(
          context.locale.checkMessages,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        CustomButton.text(
          backgroundColor: context.theme.redColor,
          text: context.locale.notificationDidntArrived,
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          onTap: onNotificationArrivedTap,
        ),
        const SizedBox(height: CommonDimensions.medium),
        CustomButton.text(
          backgroundColor: context.theme.greenColor,
          text: context.locale.notificationArrived,
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          onTap: onNotificationDidntArrivedTap,
        ),
      ],
    );
  }
}

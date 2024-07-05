import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';

import 'package:flutter/material.dart';

class EnterContactBody extends StatelessWidget {
  final String firstContentInfoTitle;
  final String secondContentInfoTitle;
  final String secondContentInfoSubtitle;
  final String price;
  final String additionalPayment;
  final String payment;
  const EnterContactBody({
    required this.firstContentInfoTitle,
    required this.secondContentInfoTitle,
    required this.secondContentInfoSubtitle,
    required this.price,
    required this.additionalPayment,
    required this.payment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        InputField(
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: CommonDimensions.medium,
              horizontal: CommonDimensions.large,
            ),
            filled: true,
            fillColor: context.theme.secondaryColor,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  CommonDimensions.large,
                ),
              ),
              borderSide: BorderSide(
                color: context.theme.quaternaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  CommonDimensions.large,
                ),
              ),
              borderSide: BorderSide(
                color: context.theme.quaternaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.errorColor),
            ),
            hintText: context.locale.yourName,
            hintStyle: context.themeData.textTheme.titleLarge?.copyWith(
              color: context.theme.secondaryTextColor,
            ),
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        InputField(
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: CommonDimensions.medium,
              horizontal: CommonDimensions.large,
            ),
            filled: true,
            fillColor: context.theme.secondaryColor,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  CommonDimensions.large,
                ),
              ),
              borderSide: BorderSide(
                color: context.theme.quaternaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  CommonDimensions.large,
                ),
              ),
              borderSide: BorderSide(
                color: context.theme.quaternaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.errorColor),
            ),
            hintText: context.locale.phoneNumber,
            hintStyle: context.themeData.textTheme.titleLarge?.copyWith(
              color: context.theme.secondaryTextColor,
            ),
          ),
        ),
        const SizedBox(height: CommonDimensions.medium),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.locale.leavePhoneNumberWithMessenger,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  fontSize: CommonFonts.sizeTitleMedium,
                  color: context.theme.primaryTextColor,
                  fontWeight: CommonFonts.regular,
                ),
              ),
              TextSpan(
                text: ' ${context.locale.confirmationSentThere}',
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  fontSize: CommonFonts.sizeTitleMedium,
                  color: context.theme.tertiaryTextColor,
                  fontWeight: CommonFonts.regular,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        ContentInfo(
          color: context.theme.mainColor,
          assetPath: CommonAssets.starIcon,
          title: firstContentInfoTitle,
        ),
        const SizedBox(height: CommonDimensions.medium),
        ContentInfo(
          color: context.theme.mainColor,
          assetPath: CommonAssets.starIcon,
          title: secondContentInfoTitle,
          subtitle: secondContentInfoSubtitle,
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.locale.price}:',
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: CommonFonts.regular,
              ),
            ),
            Text(
              price,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: CommonFonts.regular,
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.small),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.locale.additionalPayment}:',
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: CommonFonts.regular,
              ),
            ),
            Text(
              payment,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: CommonFonts.regular,
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.small),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.locale.toPay}:',
              style: context.themeData.textTheme.displaySmall,
            ),
            Text(
              additionalPayment,
              style: context.themeData.textTheme.displaySmall,
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.medium),
        CustomButton.text(
          text: context.locale.book,
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          onTap: () {},
        ),
        const SizedBox(height: CommonDimensions.medium),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.locale.iAgreeWith,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontSize: CommonFonts.sizeTitleMedium,
                  fontWeight: CommonFonts.regular,
                ),
              ),
              TextSpan(
                text: context.locale.privacyPolicy.toLowerCase(),
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.tertiaryTextColor,
                  fontSize: CommonFonts.sizeTitleMedium,
                  fontWeight: CommonFonts.regular,
                ),
              ),
              TextSpan(
                text: context.locale.and.toLowerCase(),
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontSize: CommonFonts.sizeTitleMedium,
                  fontWeight: CommonFonts.regular,
                ),
              ),
              TextSpan(
                text: context.locale.processingOfPersonalData.toLowerCase(),
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.tertiaryTextColor,
                  fontSize: CommonFonts.sizeTitleMedium,
                  fontWeight: CommonFonts.regular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

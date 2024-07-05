import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class BasketBody extends StatelessWidget {
  final String title;
  final String subtitle;
  final String address;
  final String visitTime;
  final String visitHour;
  final String visitPrice;
  final String contentInfoTitle;
  final String contentInfoSubtitle;
  final String price;
  final String additionalPayment;
  final String payment;
  const BasketBody({
    required this.title,
    required this.subtitle,
    required this.address,
    required this.visitTime,
    required this.visitHour,
    required this.visitPrice,
    required this.contentInfoTitle,
    required this.contentInfoSubtitle,
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
        Text(
          title,
          style: context.themeData.textTheme.displaySmall?.copyWith(
            color: context.theme.tertiaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        Text(
          subtitle,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: CommonFonts.medium,
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        Row(
          children: [
            const CustomVectorImage(
              svgAssetPath: CommonAssets.locationIcon,
            ),
            const SizedBox(width: CommonDimensions.medium),
            Text(
              address,
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                fontSize: CommonFonts.sizeTitleMedium,
                fontWeight: CommonFonts.medium,
              ),
            ),
            const Spacer(),
            Text(
              context.locale.onTheMap,
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.tertiaryTextColor,
                fontSize: CommonFonts.sizeTitleMedium,
                fontWeight: CommonFonts.medium,
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.large),
        Container(
          padding: const EdgeInsets.all(CommonDimensions.large),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.large,
              ),
            ),
            border: Border.all(
              color: context.theme.mainColor.withOpacity(.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    context.locale.visit,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      fontSize: CommonFonts.sizeTitleMedium,
                      fontWeight: CommonFonts.semiBold,
                    ),
                  ),
                  Text(
                    visitTime,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      fontSize: CommonFonts.sizeTitleMedium,
                      fontWeight: CommonFonts.regular,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    context.locale.quantity,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      fontSize: CommonFonts.sizeTitleMedium,
                      fontWeight: CommonFonts.semiBold,
                    ),
                  ),
                  Text(
                    visitHour,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      fontSize: CommonFonts.sizeTitleMedium,
                      fontWeight: CommonFonts.regular,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    visitPrice,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      fontSize: CommonFonts.sizeTitleMedium,
                      fontWeight: CommonFonts.semiBold,
                    ),
                  ),
                  Text(
                    context.locale.delete,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      fontSize: CommonFonts.sizeTitleMedium,
                      fontWeight: CommonFonts.regular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        Text(
          context.locale.participantInfo,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: CommonFonts.medium,
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        Text(
          context.locale.enterYourFullName,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        InputField(
          hintText: context.locale.participantInfoNo,
        ),
        const SizedBox(height: CommonDimensions.large),
        CustomButton.text(
          text: context.locale.addParticipant,
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.tertiaryTextColor,
          ),
          boxDecoration: BoxDecoration(
            color: context.theme.mainColor.withOpacity(.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.large,
              ),
            ),
          ),
          onTap: () {},
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        ContentInfo(
          color: context.theme.greenColor,
          title: contentInfoTitle,
          subtitle: contentInfoSubtitle,
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
              additionalPayment,
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
              context.locale.toPay,
              style: context.themeData.textTheme.displaySmall,
            ),
            Text(
              payment,
              style: context.themeData.textTheme.displaySmall,
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.large),
        CustomButton.text(
          text: context.locale.checkout,
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

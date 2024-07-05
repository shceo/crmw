import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class ConfirmReserveBody extends StatefulWidget {
  final String confirmationNumber;
  final String clientNumber;
  final String supportEmail;
  final VoidCallback onWhatsappTap;
  final VoidCallback onTelegramTap;
  final VoidCallback onVkTap;
  final VoidCallback onReceivedMessageTap;
  final VoidCallback onEditNumberTap;
  final VoidCallback onReservePageReturnTap;

  const ConfirmReserveBody({
    required this.confirmationNumber,
    required this.clientNumber,
    required this.supportEmail,
    required this.onWhatsappTap,
    required this.onTelegramTap,
    required this.onVkTap,
    required this.onReceivedMessageTap,
    required this.onEditNumberTap,
    required this.onReservePageReturnTap,
    super.key,
  });

  @override
  State<ConfirmReserveBody> createState() => _ConfirmReserveBodyState();
}

class _ConfirmReserveBodyState extends State<ConfirmReserveBody> {
  int messengerCurrentIndex = 0;

  late final int whatsappIndex;
  late final int telegramIndex;
  late final int vkIndex;

  @override
  void initState() {
    super.initState();

    whatsappIndex = 0;
    telegramIndex = 1;
    vkIndex = 2;
  }

  String getMessengerName(BuildContext context, int currentIndex) {
    return switch (currentIndex) {
      0 => context.locale.whatsapp,
      1 => context.locale.telegram,
      2 => context.locale.vk,
      _ => throw UnimplementedError(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        Text(
          context.locale.waitingReserveConfirmation,
          style: context.themeData.textTheme.displaySmall,
        ),
        const SizedBox(height: CommonDimensions.large),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.locale.checkReserveMessage,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.secondaryTextColor,
                  fontWeight: CommonFonts.regular,
                ),
              ),
              TextSpan(
                text: ' ${widget.confirmationNumber} ',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.tertiaryTextColor,
                  fontWeight: CommonFonts.regular,
                ),
              ),
              TextSpan(
                text: context.locale.onYourPhoneNumber,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.secondaryTextColor,
                  fontWeight: CommonFonts.regular,
                ),
              ),
              TextSpan(
                text:
                    // ignore: lines_longer_than_80_chars
                    ' ${widget.clientNumber} ${context.locale.on} ${getMessengerName(
                  context,
                  messengerCurrentIndex,
                )}',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.tertiaryTextColor,
                  fontWeight: CommonFonts.regular,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: CommonDimensions.superLarge),
        const _CustomDivider(),
        const SizedBox(height: CommonDimensions.large),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _MessengerButton(
              messengerIndex: whatsappIndex,
              messengerCurrentIndex: messengerCurrentIndex,
              assetPath: CommonAssets.whatsappLogo,
              onTap: () {
                setState(() {
                  messengerCurrentIndex = whatsappIndex;
                });

                widget.onWhatsappTap();
              },
            ),
            const SizedBox(width: CommonDimensions.large),
            _MessengerButton(
              messengerIndex: telegramIndex,
              messengerCurrentIndex: messengerCurrentIndex,
              assetPath: CommonAssets.telegramLogo,
              onTap: () {
                setState(() {
                  messengerCurrentIndex = telegramIndex;
                });

                widget.onTelegramTap();
              },
            ),
            const SizedBox(width: CommonDimensions.large),
            _MessengerButton(
              messengerIndex: vkIndex,
              messengerCurrentIndex: messengerCurrentIndex,
              assetPath: CommonAssets.vkLogo,
              onTap: () {
                setState(() {
                  messengerCurrentIndex = vkIndex;
                });

                widget.onVkTap();
              },
            ),
          ],
        ),
        const SizedBox(height: CommonDimensions.superLarge),
        CustomButton.text(
          text: '${context.locale.iReceivedMessageOn} ${getMessengerName(
            context,
            messengerCurrentIndex,
          )}',
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          onTap: widget.onReceivedMessageTap,
        ),
        const SizedBox(height: CommonDimensions.large),
        CustomButton.text(
          text: '${context.locale.editNumber} ${getMessengerName(
            context,
            messengerCurrentIndex,
          )}',
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.tertiaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          boxDecoration: BoxDecoration(
            color: context.theme.mainColor.withOpacity(.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.large,
              ),
            ),
            border: Border.all(
              color: context.theme.mainColor.withOpacity(.3),
            ),
          ),
          onTap: widget.onEditNumberTap,
        ),
        const SizedBox(height: CommonDimensions.superLarge),
        CustomButton.text(
          text: context.locale.returnOnReservePage,
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.tertiaryTextColor,
            fontWeight: CommonFonts.semiBold,
          ),
          boxDecoration: BoxDecoration(
            color: context.theme.mainColor.withOpacity(.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.large,
              ),
            ),
            border: Border.all(
              color: context.theme.mainColor.withOpacity(.3),
            ),
          ),
          onTap: widget.onReservePageReturnTap,
        ),
      ],
    );
  }
}

class _MessengerButton extends StatelessWidget {
  final int messengerCurrentIndex;
  final int messengerIndex;
  final String assetPath;
  final VoidCallback onTap;

  const _MessengerButton({
    required this.messengerCurrentIndex,
    required this.messengerIndex,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: CommonDimensions.large,
          ),
          decoration: BoxDecoration(
            color: messengerIndex == messengerCurrentIndex
                ? context.theme.mainColor.withOpacity(.1)
                : context.theme.tertiaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.large,
              ),
            ),
            border: Border.all(
              color: messengerIndex == messengerCurrentIndex
                  ? context.theme.mainColor
                  : context.theme.quaternaryColor,
            ),
          ),
          child: CustomVectorImage(
            svgAssetPath: assetPath,
          ),
        ),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.theme.divider,
          ),
        ),
        const SizedBox(width: CommonDimensions.large),
        Text(
          context.locale.sendNotificationOn,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.tertiaryTextColor,
            fontWeight: CommonFonts.medium,
          ),
        ),
        const SizedBox(width: CommonDimensions.large),
        Expanded(
          child: Divider(
            color: context.theme.divider,
          ),
        ),
      ],
    );
  }
}

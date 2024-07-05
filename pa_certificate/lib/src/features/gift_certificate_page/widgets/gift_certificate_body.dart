import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class GiftCertificateBody extends StatefulWidget {
  const GiftCertificateBody({super.key});

  @override
  State<GiftCertificateBody> createState() => _GiftCertificateBodyState();
}

class _GiftCertificateBodyState extends State<GiftCertificateBody> {
  late final TextEditingController otpCodeController;

  @override
  void initState() {
    super.initState();

    otpCodeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    otpCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(height: CommonDimensions.superLarge),
        Text(
          'Подарочный сертификат',
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontWeight: CommonFonts.semiBold,
          ),
        ),
        const SizedBox(height: CommonDimensions.mediumLarge),
        Text(
          'Введите код подарочного сертификата для его активации.',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        InputField(
          controller: otpCodeController,
          hintText: 'Введите код',
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        CustomButton.text(
          text: 'Войти',
          onTap: () {},
        ),
        const SizedBox(
          height: CommonDimensions.multiLarge,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Есть вопросы? ',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: CommonFonts.regular,
                  ),
                ),
                TextSpan(
                  text: 'Связаться с тех.поддержкой',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.tertiaryTextColor,
                    fontWeight: CommonFonts.semiBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

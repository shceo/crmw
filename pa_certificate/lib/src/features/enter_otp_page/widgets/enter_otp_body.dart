import 'dart:async';

import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

class EnterOtpBody extends StatefulWidget {
  const EnterOtpBody({super.key});

  @override
  State<EnterOtpBody> createState() => _EnterOtpBodyState();
}

class _EnterOtpBodyState extends State<EnterOtpBody> {
  late final TextEditingController phoneNumberController;
  late final TextEditingController otpCodeController;

  late Timer timer;
  int secondsRemaining = 60;
  bool enableResend = false;

  @override
  void initState() {
    super.initState();

    phoneNumberController = TextEditingController(
      text: '+7 (977) 110-82-09',
    );
    otpCodeController = TextEditingController();

    // timer = Timer.periodic(
    //   const Duration(seconds: 1),
    //   (_) {
    //     if (secondsRemaining != 0) {
    //       setState(() {
    //         secondsRemaining--;
    //       });
    //     } else {
    //       setState(() {
    //         enableResend = true;
    //       });
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();

    timer.cancel();

    phoneNumberController.dispose();
    otpCodeController.dispose();
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        const SizedBox(height: CommonDimensions.superLarge),
        Text(
          'Введите код из смс',
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontWeight: CommonFonts.semiBold,
          ),
        ),
        const SizedBox(height: CommonDimensions.mediumLarge),
        Text(
          'Введите код из смс, который пришёл на номер +7 (977) 110-82-09',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.extraLarge),
        InputField(
          controller: phoneNumberController,
        ),
        const SizedBox(height: CommonDimensions.large),
        InputField(
          controller: otpCodeController,
          hintText: 'Введите код',
        ),
        const SizedBox(height: CommonDimensions.large),
        if (enableResend == false)
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Получить новый код ($secondsRemaining с.)',
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.secondaryTextColor,
                fontWeight: CommonFonts.regular,
              ),
            ),
          ),
        if (enableResend == true)
          InkWell(
            onTap: _resendCode,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Получить новый код',
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.tertiaryTextColor,
                  fontWeight: CommonFonts.regular,
                ),
              ),
            ),
          ),
        const SizedBox(height: CommonDimensions.large),
        CustomButton.text(
          text: 'Далее',
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

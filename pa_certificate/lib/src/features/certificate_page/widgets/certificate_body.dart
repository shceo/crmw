import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';

import 'package:pa_certificate/src/common/utils/constants/app_assets.dart';
import 'package:pa_certificate/src/common/utils/converters/certificate_status_converter.dart';
import 'package:pa_certificate/src/common/utils/enums/certificate_status_enum/certificate_status_enum.dart';

class CertificateBody extends StatelessWidget {
  final List<CertificateStatus> statusesWithButton;
  final List<CertificateStatus> statusesWithBorder;
  final CertificateStatus currentCertificateStatus;
  const CertificateBody({
    required this.statusesWithButton,
    required this.statusesWithBorder,
    required this.currentCertificateStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Stack(
          children: [
            const _GiftCertificateBackgroundWidget(),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(
                    CommonDimensions.commonPadding,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: CommonDimensions.extraLarge),
                      Text(
                        'Подарочный',
                        style:
                            context.themeData.textTheme.displaySmall?.copyWith(
                          color: context.theme.quaternaryTextColor,
                          fontWeight: CommonFonts.light,
                        ),
                      ),
                      Text(
                        'CЕРТИФИКАТ',
                        style:
                            context.themeData.textTheme.displayLarge?.copyWith(
                          color: context.theme.quaternaryTextColor,
                          fontSize: CommonFonts.sizeSuperDisplayLarge,
                          fontWeight: CommonFonts.light,
                        ),
                      ),
                      const SizedBox(height: CommonDimensions.extraLarge),
                      _CertificateStateWidget(
                        certificateStatus: currentCertificateStatus,
                      ),
                      const SizedBox(height: CommonDimensions.large),
                      _ReserveOrderOverviewWidget(
                        statusesWithButton: statusesWithButton,
                        statusesWithBorder: statusesWithBorder,
                        currentCertificateStatus: currentCertificateStatus,
                      ),
                      const SizedBox(height: CommonDimensions.large),
                      const _CongratulationWidget(),
                      const SizedBox(height: CommonDimensions.large),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Консультация: ',
                            style: context.themeData.textTheme.headlineMedium
                                ?.copyWith(
                              fontWeight: CommonFonts.medium,
                            ),
                          ),
                          Text(
                            '+7 (991) 923-81-95',
                            style: context.themeData.textTheme.headlineMedium
                                ?.copyWith(
                              color: context.theme.tertiaryTextColor,
                              fontWeight: CommonFonts.medium,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Связаться с тех.поддержкой',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.tertiaryTextColor,
                          fontWeight: CommonFonts.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CongratulationWidget extends StatelessWidget {
  const _CongratulationWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Поздравление',
            style: context.themeData.textTheme.headlineMedium,
          ),
          const SizedBox(height: CommonDimensions.large),
          Text(
            // ignore: lines_longer_than_80_chars
            'Конная прогулка для Вас двоих, 1 час Всего самого хорошего, любви и счастья .Конная прогулка',
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.tertiaryTextColor,
              fontWeight: CommonFonts.regular,
            ),
          ),
          const SizedBox(height: CommonDimensions.medium),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'Виктор',
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                fontWeight: CommonFonts.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReserveOrderOverviewWidget extends StatelessWidget {
  final List<CertificateStatus> statusesWithButton;
  final List<CertificateStatus> statusesWithBorder;
  final CertificateStatus currentCertificateStatus;
  const _ReserveOrderOverviewWidget({
    required this.statusesWithButton,
    required this.statusesWithBorder,
    required this.currentCertificateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
        border: statusesWithButton.contains(currentCertificateStatus) == true
            ? Border.all(
                color: context.theme.redColor,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Квадроциклы',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: CommonFonts.regular,
            ),
          ),
          Text(
            'Маршрут экстрим, 1 час',
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              fontWeight: CommonFonts.medium,
            ),
          ),
          const SizedBox(height: CommonDimensions.medium),
          Row(
            children: [
              const CustomVectorImage(
                svgAssetPath: AppAssets.locationIcon,
              ),
              const SizedBox(width: CommonDimensions.small),
              Text(
                'Ул. Киевская 59, строение 102',
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.tertiaryTextColor,
                  fontWeight: CommonFonts.regular,
                ),
              ),
            ],
          ),
          const SizedBox(height: CommonDimensions.medium),
          Text(
            '2 шт. - Доплата за пассажира',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: CommonFonts.regular,
            ),
          ),
          const SizedBox(height: CommonDimensions.small),
          Text(
            '1 шт. - Двухместный квадроцикл 800 кубов',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: CommonFonts.regular,
            ),
          ),
          const SizedBox(height: CommonDimensions.small),
          Text(
            '1 шт. - Двухместный квадроцикл 800 кубов',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: CommonFonts.regular,
            ),
          ),
          if (statusesWithBorder.contains(currentCertificateStatus))
            Column(
              children: [
                const SizedBox(
                  height: CommonDimensions.large,
                ),
                Divider(
                  color: context.theme.divider,
                ),
                const SizedBox(
                  height: CommonDimensions.large,
                ),
                CustomButton.text(
                  text: 'Информация о записи',
                  onTap: () {},
                ),
              ],
            ),
          // ignore: lines_longer_than_80_chars
          if (currentCertificateStatus ==
              CertificateStatus.certificateChooseAnotherProgramme)
            Column(
              children: [
                const SizedBox(
                  height: CommonDimensions.large,
                ),
                Divider(
                  color: context.theme.divider,
                ),
                const SizedBox(
                  height: CommonDimensions.large,
                ),
                CustomButton.text(
                  text: 'Записаться на услугу',
                  onTap: () {},
                ),
                const SizedBox(
                  height: CommonDimensions.medium,
                ),
                CustomButton.text(
                  boxDecoration: BoxDecoration(
                    color: context.theme.mainColor.withOpacity(.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        CommonDimensions.large,
                      ),
                    ),
                    border: Border.all(
                      color: context.theme.mainColor,
                    ),
                  ),
                  text: 'Подробнее об услуге',
                  textStyle:
                      context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.tertiaryTextColor,
                  ),
                  onTap: () {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _CertificateStateWidget extends StatelessWidget {
  final CertificateStatus certificateStatus;
  const _CertificateStateWidget({
    required this.certificateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
      ),
      child: Center(
        child: Text(
          CertificateStatusConverter().toText(
            certificateStatus: certificateStatus,
            dateTime: DateTime.now(),
          ),
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: CertificateStatusConverter().toColor(
              context,
              certificateStatus,
            ),
            fontWeight: CommonFonts.regular,
          ),
        ),
      ),
    );
  }
}

class _GiftCertificateBackgroundWidget extends StatelessWidget {
  const _GiftCertificateBackgroundWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.theme.mainColor.withOpacity(.8),
            context.theme.mainColor,
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(CommonDimensions.extraLarge),
          bottomRight: Radius.circular(CommonDimensions.extraLarge),
        ),
      ),
      child: Column(
        children: [
          Text(
            'СЕРТИФИКАТ',
            style: context.themeData.textTheme.displayLarge?.copyWith(
              color: context.theme.quaternaryColor.withOpacity(.3),
              fontWeight: CommonFonts.semiBold,
              fontSize: 100,
              overflow: TextOverflow.fade,
            ),
            softWrap: false,
          ),
          Text(
            'ПОДАРОЧНЫЙ',
            style: context.themeData.textTheme.displayLarge?.copyWith(
              color: context.theme.quaternaryColor.withOpacity(.3),
              fontWeight: CommonFonts.semiBold,
              fontSize: 100,
              overflow: TextOverflow.fade,
            ),
            softWrap: false,
          ),
          Text(
            'СЕРТИФИКАТ',
            style: context.themeData.textTheme.displayLarge?.copyWith(
              color: context.theme.quaternaryColor.withOpacity(.3),
              fontWeight: CommonFonts.semiBold,
              fontSize: 100,
              overflow: TextOverflow.fade,
            ),
            softWrap: false,
          ),
        ],
      ),
    );
  }
}

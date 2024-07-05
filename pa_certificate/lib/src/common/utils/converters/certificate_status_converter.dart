import 'package:common/common_theme_export.dart';
import 'package:flutter/material.dart';
import 'package:pa_certificate/src/common/utils/enums/certificate_status_enum/certificate_status_enum.dart';

final class CertificateStatusConverter {
  String toText({
    required CertificateStatus certificateStatus,
    DateTime? dateTime,
  }) {
    return switch (certificateStatus) {
      CertificateStatus.certificateNotConfirmed => 'Активирован',
      CertificateStatus.certificateConfirmed => 'Использован',
      CertificateStatus.certificateExpired => 'Сертификат сгорел. ',
      CertificateStatus.certificateRequestedFullRefund =>
        'Сертификат аннулирован',
      CertificateStatus.certificateFullRefund => 'Сертификат аннулирован',
      CertificateStatus.certificateRequestedPartialRefund =>
        'Сертификат использован',
      CertificateStatus.certificatePartialRefund => 'Сертификат использован',
      CertificateStatus.certificateChooseAnotherProgramme =>
        'Срок действия до $dateTime',
    };
  }

  Color toColor(BuildContext context, CertificateStatus certificateStatus) {
    return switch (certificateStatus) {
      CertificateStatus.certificateNotConfirmed => context.theme.greenColor,
      CertificateStatus.certificateConfirmed => context.theme.tertiaryTextColor,
      CertificateStatus.certificateExpired => context.theme.redColor,
      CertificateStatus.certificateRequestedFullRefund =>
        context.theme.redColor,
      CertificateStatus.certificateFullRefund => context.theme.redColor,
      CertificateStatus.certificateRequestedPartialRefund =>
        context.theme.tertiaryTextColor,
      CertificateStatus.certificatePartialRefund =>
        context.theme.tertiaryTextColor,
      CertificateStatus.certificateChooseAnotherProgramme =>
        context.theme.tertiaryTextColor,
    };
  }
}

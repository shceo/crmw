import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_certificate/src/common/utils/enums/certificate_status_enum/certificate_status_enum.dart';

part 'certificate_state.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit()
      : super(
          const CertificateState(
            statusesWithButton: <CertificateStatus>[
              CertificateStatus.certificateConfirmed,
              CertificateStatus.certificateNotConfirmed,
              CertificateStatus.certificatePartialRefund,
              CertificateStatus.certificateRequestedPartialRefund,
            ],
            statusesWithBorder: <CertificateStatus>[
              CertificateStatus.certificateExpired,
              CertificateStatus.certificateRequestedFullRefund,
              CertificateStatus.certificateFullRefund,
            ],
            currentCertificateStatus:
                CertificateStatus.certificateChooseAnotherProgramme,
          ),
        );
}

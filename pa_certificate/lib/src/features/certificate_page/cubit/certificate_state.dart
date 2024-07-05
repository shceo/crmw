part of 'certificate_cubit.dart';

final class CertificateState extends Equatable {
  final List<CertificateStatus> statusesWithButton;
  final List<CertificateStatus> statusesWithBorder;
  final CertificateStatus currentCertificateStatus;

  @override
  List<Object?> get props => [
        statusesWithButton,
        statusesWithBorder,
        currentCertificateStatus,
      ];

  const CertificateState({
    required this.statusesWithButton,
    required this.statusesWithBorder,
    required this.currentCertificateStatus,
  });

  CertificateState copyWith(
    List<CertificateStatus>? statusesWithButton,
    List<CertificateStatus>? statusesWithBorder,
    CertificateStatus? currentCertificateStatus,
  ) {
    return CertificateState(
      statusesWithButton: statusesWithButton ?? this.statusesWithButton,
      statusesWithBorder: statusesWithBorder ?? this.statusesWithBorder,
      currentCertificateStatus:
          currentCertificateStatus ?? this.currentCertificateStatus,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'certificate_buyer_state.dart';

class CertificateBuyerCubit extends Cubit<CertificateBuyerState> {
  CertificateBuyerCubit()
      : super(
          const CertificateBuyerState(),
        );
}

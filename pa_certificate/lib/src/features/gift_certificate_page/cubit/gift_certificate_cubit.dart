import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gift_certificate_state.dart';

class GiftCertificateCubit extends Cubit<GiftCertificateState> {
  GiftCertificateCubit()
      : super(
          const GiftCertificateState(),
        );
}

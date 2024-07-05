import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'enter_otp_state.dart';

class EnterOtpCubit extends Cubit<EnterOtpState> {
  EnterOtpCubit()
      : super(
          const EnterOtpState(),
        );
}

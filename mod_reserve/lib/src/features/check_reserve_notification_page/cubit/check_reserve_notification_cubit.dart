import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_reserve_notification_state.dart';

class CheckReserveNotificationCubit
    extends Cubit<CheckReserveNotificationState> {
  CheckReserveNotificationCubit()
      : super(
          const CheckReserveNotificationState(),
        );
}

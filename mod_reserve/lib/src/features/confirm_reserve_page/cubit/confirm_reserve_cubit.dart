import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'confirm_reserve_state.dart';

class ConfirmReserveCubit extends Cubit<ConfirmReserveState> {
  ConfirmReserveCubit()
      : super(
          const ConfirmReserveState(),
        );
}

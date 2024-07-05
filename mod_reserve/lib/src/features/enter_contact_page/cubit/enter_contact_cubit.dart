import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'enter_contact_state.dart';

class EnterContactCubit extends Cubit<EnterContactState> {
  EnterContactCubit()
      : super(
          const EnterContactState(),
        );
}

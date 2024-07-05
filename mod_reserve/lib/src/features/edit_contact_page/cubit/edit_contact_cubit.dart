import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_contact_state.dart';

class EditContactCubit extends Cubit<EditContactState> {
  EditContactCubit()
      : super(
          const EditContactState(),
        );
}

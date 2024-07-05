import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit()
      : super(
          const AddState(),
        );
}

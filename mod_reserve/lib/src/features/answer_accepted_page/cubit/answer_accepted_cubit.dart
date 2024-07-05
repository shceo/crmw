import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'answer_accepted_state.dart';

class AnswerAcceptedCubit extends Cubit<AnswerAcceptedState> {
  AnswerAcceptedCubit()
      : super(
          const AnswerAcceptedState(),
        );
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'thanksgiving_state.dart';

class ThanksgivingCubit extends Cubit<ThanksgivingState> {
  ThanksgivingCubit()
      : super(
          const ThanksgivingState(),
        );
}

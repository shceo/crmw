import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blocks_state.dart';

class BlocksCubit extends Cubit<BlocksState> {
  BlocksCubit()
      : super(
          const BlocksState(
            blocks: [],
          ),
        ) {
    load();
  }

  Future<void> load() async {
    emit(
      const BlocksState(
        blocks: [],
      ),
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    emit(
      const BlocksState(
        blocks: ['firstmock', 'secondmock'],
      ),
    );
  }
}

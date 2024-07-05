import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_panel_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  final navigationStack = <int>[];

  NavigationPanelCubit()
      : super(
          const NavigationPanelState(
            navigationIndex: 0,
          ),
        );

  void updateNavigationIndex(int navigationIndex) {
    if (state.navigationIndex == navigationIndex) return;

    navigationStack.add(state.navigationIndex);

    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
      ),
    );
  }
}

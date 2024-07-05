part of 'navigation_panel_cubit.dart';

final class NavigationPanelState extends Equatable {
  final int navigationIndex;

  @override
  List<Object?> get props => [
        navigationIndex,
      ];

  const NavigationPanelState({
    required this.navigationIndex,
  });

  NavigationPanelState copyWith({
    int? navigationIndex,
  }) {
    return NavigationPanelState(
      navigationIndex: navigationIndex ?? this.navigationIndex,
    );
  }
}

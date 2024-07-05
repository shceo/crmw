part of 'app_overlay_cubit.dart';

final class AppOverlayState {
  final SystemUiOverlayStyle? style;
  final bool shouldUpdateRoot;
  final bool shouldReset;

  const AppOverlayState({
    this.style,
    this.shouldUpdateRoot = false,
    this.shouldReset = false,
  });

  AppOverlayState copyWith({
    SystemUiOverlayStyle? style,
    bool? shouldUpdateRoot,
    bool? shouldReset,
  }) {
    return AppOverlayState(
      style: style ?? this.style,
      shouldUpdateRoot: shouldUpdateRoot ?? this.shouldUpdateRoot,
      shouldReset: shouldReset ?? this.shouldReset,
    );
  }
}

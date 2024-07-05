import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_overlay_state.dart';

class AppOverlayCubit extends Cubit<AppOverlayState> {
  final List<SystemUiOverlayStyle> _styleStack = [];

  AppOverlayCubit()
      : super(
          const AppOverlayState(),
        );

  Future<void> applyStyle(SystemUiOverlayStyle style) async {
    final combined = await _combine(style);
    emit(
      state.copyWith(style: style),
    );
    _styleStack.add(combined);
  }

  void markShouldReplaceRoot() {
    emit(state.copyWith(shouldUpdateRoot: true));
  }

  void replaceRoot(SystemUiOverlayStyle style) {
    if (_styleStack.isEmpty) {
      applyStyle(style);
    } else {
      _styleStack.first = style;

      // ignore: prefer-async-await
      _restyleBasedOnNewRoot().then(
        (_) => emit(
          state.copyWith(
            style: style,
            shouldUpdateRoot: false,
          ),
        ),
      );
    }
  }

  void applyPreviousStyle() {
    if (_styleStack.length > 1) {
      _styleStack.removeLast();
      emit(state.copyWith(style: _styleStack.last));
    }
  }

  void reset(SystemUiOverlayStyle base) {
    _styleStack.clear();
    emit(state.copyWith(style: base, shouldReset: false));
    _styleStack.add(base);
  }

  void setOnReset() => emit(
        state.copyWith(shouldReset: true),
      );

  Future<void> _restyleBasedOnNewRoot() async {
    for (var i = 1; i < _styleStack.length; i++) {
      _styleStack[i] = await _combine(_styleStack[i], _styleStack[i - 1]);
    }
  }

  Future<SystemUiOverlayStyle> _combine(
    SystemUiOverlayStyle style, [
    SystemUiOverlayStyle? base,
  ]) async {
    if (_styleStack.isEmpty) {
      return style;
    } else {
      final baseStyle = base ?? _styleStack.last;
      return baseStyle.copyWith(
        systemNavigationBarColor: style.systemNavigationBarColor ??
            baseStyle.systemNavigationBarColor,
        systemNavigationBarDividerColor:
            style.systemNavigationBarDividerColor ??
                baseStyle.systemNavigationBarDividerColor,
        systemNavigationBarContrastEnforced:
            style.systemNavigationBarContrastEnforced ??
                baseStyle.systemNavigationBarContrastEnforced,
        statusBarColor: style.statusBarColor ?? baseStyle.statusBarColor,
        statusBarBrightness:
            style.statusBarBrightness ?? baseStyle.statusBarBrightness,
        statusBarIconBrightness:
            style.statusBarIconBrightness ?? baseStyle.statusBarIconBrightness,
        systemStatusBarContrastEnforced:
            style.systemStatusBarContrastEnforced ??
                baseStyle.systemStatusBarContrastEnforced,
        systemNavigationBarIconBrightness:
            style.systemNavigationBarIconBrightness ??
                baseStyle.systemNavigationBarIconBrightness,
      );
    }
  }
}

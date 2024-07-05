part of 'app_cubit.dart';

class AppState {
  final ThemeType themeType;

  AppState({
    required this.themeType,
  });

  AppState copyWith({bool? toRemoteConnected, ThemeType? themeType}) {
    return AppState(
      themeType: themeType ?? this.themeType,
    );
  }
}

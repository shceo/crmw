part of 'theme_shared_cubit.dart';

final class ThemeSharedState {
  final ThemeType themeType;

  const ThemeSharedState({
    this.themeType = ThemeType.light,
  });

  ThemeSharedState copyWith({
    ThemeType? themeType,
  }) {
    return ThemeSharedState(
      themeType: themeType ?? this.themeType,
    );
  }
}

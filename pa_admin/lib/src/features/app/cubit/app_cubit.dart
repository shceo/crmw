import 'package:common/common_shared_cubit_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final ThemeSharedCubit _themeCubit;

  AppCubit(
    this._themeCubit,
  ) : super(
          AppState(
            themeType: _themeCubit.state.themeType,
          ),
        ) {
    _onAppStarted();
  }

  void _onAppStarted() {
    _changeTheme(_themeCubit.state.themeType);
    _themeCubit.stream.listen(
      (state) {
        _changeTheme(state.themeType);
      },
    );
  }

  void _changeTheme(ThemeType themeType) {
    emit(
      state.copyWith(themeType: themeType),
    );
  }
}

import 'package:common/src/utils/enums/theme_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_shared_state.dart';

class ThemeSharedCubit extends Cubit<ThemeSharedState> {
  ThemeSharedCubit()
      : super(
          const ThemeSharedState(),
        );
}

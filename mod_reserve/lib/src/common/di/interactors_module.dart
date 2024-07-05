//  We don't use this yet
import 'package:core/domain/interactors/mod_reserve_interactor.dart';
import 'package:mod_reserve/src/common/di/injector.dart';

void initInteractors() {
  i.registerSingleton<ModReserveInteractor>(
    ModReserveInteractor(
      i.get(),
    ),
  );
}

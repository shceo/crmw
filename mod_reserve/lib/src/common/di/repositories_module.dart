import 'package:core/data/repositories/mod_reserve_repository/mod_reserve_repository.dart';
import 'package:core/domain/interfaces/i_mod_reserve_repository/i_mod_reserve_repository.dart';
import 'package:mod_reserve/src/common/di/injector.dart';

void initRepositories() {
  i.registerSingleton<IModReserveRepository>(
    ModReserveRepository(
      i.get(),
    ),
  );
}

//  We don't use this yet
import 'package:core/data/data_sources/interfaces/i_mod_reserve_data_source.dart';
import 'package:core/data/data_sources/mod_reserve_data_source.dart';
import 'package:mod_reserve/src/common/di/injector.dart';

void initDataSource() {
  i.registerSingleton<IModReserveDataSource>(
    ModReserveDataSource(),
  );
}

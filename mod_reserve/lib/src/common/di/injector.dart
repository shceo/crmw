import 'package:get_it/get_it.dart';
import 'package:mod_reserve/src/common/di/cubit_module.dart';
import 'package:mod_reserve/src/common/di/data_source_module.dart';
import 'package:mod_reserve/src/common/di/interactors_module.dart';
import 'package:mod_reserve/src/common/di/page_module.dart';
import 'package:mod_reserve/src/common/di/repositories_module.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  initDataSource();
  initRepositories();
  initInteractors();
  initCubits();
  initSharedCubits();
  initPages();
}

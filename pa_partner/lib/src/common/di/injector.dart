import 'package:get_it/get_it.dart';
import 'package:pa_partner/src/common/di/cubit_module.dart';
import 'package:pa_partner/src/common/di/page_module.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  initSharedCubits();
  initCubits();
  initPages();
}

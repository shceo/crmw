import 'package:common/src/localization/flutter_gen/crm_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationsExt on BuildContext {
  CrmLocalization get locale => CrmLocalization.of(this);
}

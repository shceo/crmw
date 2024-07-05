// ignore_for_file: unnecessary_this

import 'package:common/common_localization_export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }

  String toMMMMFormat(BuildContext context) {
    final parse = DateTime.parse(this);
    final formatted =
        DateFormat('MMMM', context.locale.localeName).format(parse);

    return formatted;
  }

  String toYyyyFormat() {
    final parse = DateTime.parse(this);
    final formatted = DateFormat('yyyy').format(parse);

    return formatted;
  }

  String toHHmm() {
    final parse = DateTime.parse(this);
    final formatted = DateFormat('HH:mm').format(parse);

    return formatted;
  }
}

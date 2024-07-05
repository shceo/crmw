import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';

extension DeviceSize on BuildContext {
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;

  double get adaptiveDeviceWidth =>
      MediaQuery.of(this).size.width > CommonDimensions.maxPhoneWidth
          ? CommonDimensions.maxPhoneWidth
          : MediaQuery.of(this).size.width;
}

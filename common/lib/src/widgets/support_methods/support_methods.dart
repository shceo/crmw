import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

abstract final class SupportMethods {
  static Future<void> showCrmDialog({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool useRootNavigator = false,
    bool userSafeArea = true,
    bool barrierDismissible = true,
  }) async {
    await showCupertinoDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: builder,
      useRootNavigator: useRootNavigator,
    );

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }
}

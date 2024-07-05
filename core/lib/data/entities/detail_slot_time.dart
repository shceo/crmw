import 'package:common/common_utils_export.dart';

final class DetailSlotTime {
  final String dateTimeStart;
  final String dateTimeEnd;
  final String value;
  final String symbol;
  final TimeSlotStatus status;

  const DetailSlotTime({
    required this.dateTimeStart,
    required this.dateTimeEnd,
    required this.value,
    required this.symbol,
    required this.status,
  });
}

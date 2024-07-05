part of 'calendar_cubit.dart';

final class CalendarState extends Equatable {
  final List<BrandServiceAddress> brandServiceAddress;
  @override
  List<Object?> get props => [brandServiceAddress];

  const CalendarState({required this.brandServiceAddress,});

  CalendarState copyWith({List<BrandServiceAddress>? brandServiceAddress}) {
    return CalendarState(
      brandServiceAddress: brandServiceAddress ?? this.brandServiceAddress,
    );
  }
}

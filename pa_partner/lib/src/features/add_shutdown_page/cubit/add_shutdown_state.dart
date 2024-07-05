part of 'add_shutdown_cubit.dart';

final class AddShutdownState extends Equatable {
  final List<String> selectedServices;
  final List<Map<String, dynamic>> servicesGroup;

  final List programs;

  @override
  List<Object?> get props => [
        selectedServices,
        servicesGroup,
      ];

  const AddShutdownState({
    required this.selectedServices,
    required this.servicesGroup,
    required this.programs,
  });

  AddShutdownState copyWith({
    List<String>? selectedServices,
    List<Map<String, dynamic>>? servicesGroup,
    List? programs,
  }) {
    return AddShutdownState(
      selectedServices: selectedServices ?? this.selectedServices,
      servicesGroup: servicesGroup ?? this.servicesGroup,
      programs: programs ?? this.programs,
    );
  }
}

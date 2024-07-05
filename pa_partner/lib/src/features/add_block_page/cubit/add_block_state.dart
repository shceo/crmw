part of 'add_block_cubit.dart';

final class AddBlockState extends Equatable {
  final List<String> selectedBrands;

  final List<Map<String, dynamic>> brandsGroup;

  @override
  List<Object?> get props => [
        selectedBrands,
        brandsGroup,
      ];

  const AddBlockState({
    required this.selectedBrands,
    required this.brandsGroup,
  });

  AddBlockState copyWith({
    List<String>? selectedBrands,
    List<Map<String, dynamic>>? brandsGroup,
  }) {
    return AddBlockState(
      selectedBrands: selectedBrands ?? this.selectedBrands,
      brandsGroup: brandsGroup ?? this.brandsGroup,
    );
  }
}

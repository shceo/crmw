import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_block_state.dart';

class AddBlockCubit extends Cubit<AddBlockState> {
  AddBlockCubit()
      : super(
          const AddBlockState(
            brandsGroup: [
              {
                'label': 'Выберите отключаемый бренд',
                'brands': ['Лесной патруль'],
              },
              {
                'label': 'Выберите отключаемый бренд',
                'brands': [
                  'Запретить бронирования на указанный период',
                  'Запретить покупки броней и сертификатов в указанный период',
                ],
              },
            ],
            selectedBrands: [],
          ),
        );

  void toggleBrand({required String label, bool? value}) {
    final selected = state.selectedBrands.toList();

    emit(
      state.copyWith(
        selectedBrands:
            value ?? false ? (selected..add(label)) : (selected..remove(label)),
      ),
    );
  }
}

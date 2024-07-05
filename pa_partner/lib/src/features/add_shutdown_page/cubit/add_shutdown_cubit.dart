import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_shutdown_state.dart';

class AddShutdownCubit extends Cubit<AddShutdownState> {
  AddShutdownCubit()
      : super(
          const AddShutdownState(
            selectedServices: [],
            servicesGroup: [
              {
                'label': 'Выберите номиналы для отключения',
                'services': [
                  'Двухместный квадроцикл для катаний',
                  'Двухместный снегоход для катаний',
                  'Доплата за пассажира',
                  'Одноместный мотоцикл для катаний',
                  'Фотосъёмка',
                ],
              },
              {
                'label': 'Отключаемы возможности',
                'services': [
                  'Двухместный квадроцикл для катаний',
                  'Доплата за пассажира',
                ],
              },
            ],
            programs: ['asd'],
          ),
        );

  void toggleService({required String label, bool? value}) {
    final selected = state.selectedServices.toList();
    emit(
      state.copyWith(
        selectedServices:
            value ?? false ? (selected..add(label)) : (selected..remove(label)),
      ),
    );
  }
}

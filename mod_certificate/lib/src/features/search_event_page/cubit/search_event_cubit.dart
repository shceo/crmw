import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event_state.dart';

class SearchEventCubit extends Cubit<SearchEventState> {
  SearchEventCubit()
      : super(
          const SearchEventState(),
        );
}

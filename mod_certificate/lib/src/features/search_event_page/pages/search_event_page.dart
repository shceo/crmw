import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_certificate/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_certificate/src/features/search_event_page/cubit/search_event_cubit.dart';
import 'package:mod_certificate/src/features/search_event_page/widgets/search_event_body.dart';

class SearchEventPage extends StatelessWidget {
  const SearchEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<SearchEventCubit>(
      child: BlocBuilder<SearchEventCubit, SearchEventState>(
        builder: (context, state) {
          final cubit = CubitScope.of<SearchEventCubit>(context);
          return BasePage(
            body: SearchEventBody(
              searchEventCubit: cubit,
            ),
          );
        },
      ),
    );
  }
}

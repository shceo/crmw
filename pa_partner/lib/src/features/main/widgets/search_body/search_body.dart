import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/features/main/cubit/search_cubit/search_cubit.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<SearchCubit>(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(CommonDimensions.commonPadding),
            children: const [
              Text('Search'),
            ],
          );
        },
      ),
    );
  }
}

import 'package:common/common_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:mod_certificate/src/features/search_event_page/cubit/search_event_cubit.dart';

class SearchEventBody extends StatelessWidget {
  final SearchEventCubit searchEventCubit;
  const SearchEventBody({
    required this.searchEventCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(CommonDimensions.large),
      // Delete this ignore after adding widget in children
      // ignore: prefer_const_literals_to_create_immutables
      children: [],
    );
  }
}

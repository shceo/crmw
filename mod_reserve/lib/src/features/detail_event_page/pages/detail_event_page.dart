// ignore_for_file: lines_longer_than_80_chars

import 'package:common/common_navigation_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/common/di/injector.dart';
import 'package:mod_reserve/src/features/detail_event_page/cubit/detail_event_cubit.dart';
import 'package:mod_reserve/src/features/detail_event_page/widgets/detail_event_body.dart';

class DetailEventPage extends StatefulWidget {
  final int categoryId;
  final int programmeId;
  final int addressId;
  final String categoryName;
  const DetailEventPage({
    required this.categoryId,
    required this.programmeId,
    required this.addressId,
    required this.categoryName,
    super.key,
  });

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  final cubit = i.get<DetailEventCubit>();

  @override
  void initState() {
    super.initState();
    cubit
      ..getBrandServiceDetailProgramme(
        categoryId: widget.categoryId,
        programmeId: widget.programmeId,
      )
      ..getBrandServiceDate(
        programmeId: widget.programmeId,
        addressId: widget.addressId,
      )
      ..updatePageParameters(
        categoryId: widget.categoryId,
        programmeId: widget.programmeId,
        addressId: widget.addressId,
      );
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<DetailEventCubit>(
      child: BlocBuilder<DetailEventCubit, DetailEventState>(
        builder: (context, state) {
          final cubit = CubitScope.of<DetailEventCubit>(context);
          if (state.brandServiceDetailProgramme!.isEmpty &&
              state.brandServiceDate!.isEmpty) {
            return const _StateLoaderWidget();
          }

          return BasePage(
            body: DetailEventBody(
              detailEventCubit: cubit,
              categoryId: widget.categoryId,
              programmeId: widget.programmeId,
              categoryName: widget.categoryName,
              brandServiceDetailProgramme: state.brandServiceDetailProgramme,
              currentProgramDuration: state.currentProgramDuration,
              brandServiceDenomination: state.brandServiceDenomination,
              brandServiceDate: state.brandServiceDate,
              brandServiceTimeSlot: state.brandServiceTimeSlot,
              selectedDateTime: state.selectedDate,
              onBackButtonTap: cubit.onBackButtonTap,
              onTap: () {}, 
            ),
          );
        },
      ),
    );
  }
}

class _StateLoaderWidget extends StatelessWidget {
  const _StateLoaderWidget();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Center(
        child: CircularProgressIndicator(
          color: context.theme.mainColor,
        ),
      ),
    );
  }
}

final class DetailEventArguments extends PageArguments {
  final int categoryId;
  final int programmeId;
  final int addressId;
  final String categoryName;

  @override
  List<Object?> get props => [
        categoryId,
        programmeId,
        addressId,
        categoryName,
      ];

  DetailEventArguments({
    required this.categoryId,
    required this.programmeId,
    required this.addressId,
    required this.categoryName,
  });
}

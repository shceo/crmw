import 'package:common/common_bodies_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/features/enter_contact_page/cubit/enter_contact_cubit.dart';

class EnterContactPage extends StatelessWidget {
  const EnterContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<EnterContactCubit>(
      child: BlocBuilder<EnterContactCubit, EnterContactState>(
        builder: (context, state) {
          return BasePage(
            body: EnterContactBody(
              firstContentInfoTitle:
                  EnterContactPageMock.mock.firstContentInfoTitle,
              secondContentInfoTitle:
                  EnterContactPageMock.mock.secondContentInfoTitle,
              secondContentInfoSubtitle:
                  EnterContactPageMock.mock.secondContentInfoSubtitle,
              price: EnterContactPageMock.mock.price,
              additionalPayment: EnterContactPageMock.mock.additionalPayment,
              payment: EnterContactPageMock.mock.payment,
            ),
          );
        },
      ),
    );
  }
}

class EnterContactModel {
  final String firstContentInfoTitle;
  final String secondContentInfoTitle;
  final String secondContentInfoSubtitle;
  final String price;
  final String additionalPayment;
  final String payment;

  const EnterContactModel({
    required this.firstContentInfoTitle,
    required this.secondContentInfoTitle,
    required this.secondContentInfoSubtitle,
    required this.price,
    required this.additionalPayment,
    required this.payment,
  });
}

abstract final class EnterContactPageMock {
  static const mock = EnterContactModel(
    firstContentInfoTitle: 'Сейчас вы оплачиваете 30%',
    secondContentInfoTitle: 'Сможете управлять бронью',
    secondContentInfoSubtitle:
        // ignore: lines_longer_than_80_chars
        'Сразу после оплаты, у вас будет страница, где можно изменить бронь или вернуть деньги',
    price: '4 600 ₽',
    additionalPayment: '3 700 ₽',
    payment: '900 ₽',
  );
}

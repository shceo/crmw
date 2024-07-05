import 'package:common/common_bodies_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/features/basket_page/cubit/basket_cubit.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<BasketCubit>(
      child: BlocBuilder<BasketCubit, BasketState>(
        builder: (context, state) {
          return BasePage(
            body: BasketBody(
              title: BasketPageMock.mock.title,
              subtitle: BasketPageMock.mock.subtitle,
              address: BasketPageMock.mock.address,
              visitTime: BasketPageMock.mock.visitTime,
              visitHour: BasketPageMock.mock.visitHour,
              visitPrice: BasketPageMock.mock.visitPrice,
              contentInfoTitle: BasketPageMock.mock.contentInfoTitle,
              contentInfoSubtitle: BasketPageMock.mock.contentInfoSubtitle,
              price: BasketPageMock.mock.price,
              additionalPayment: BasketPageMock.mock.additionalPayment,
              payment: BasketPageMock.mock.payment,
            ),
          );
        },
      ),
    );
  }
}

class BasketPageModel {
  final String title;
  final String subtitle;
  final String address;
  final String visitTime;
  final String visitHour;
  final String visitPrice;
  final String contentInfoTitle;
  final String contentInfoSubtitle;
  final String price;
  final String additionalPayment;
  final String payment;

  const BasketPageModel({
    required this.title,
    required this.subtitle,
    required this.address,
    required this.visitTime,
    required this.visitHour,
    required this.visitPrice,
    required this.contentInfoTitle,
    required this.contentInfoSubtitle,
    required this.price,
    required this.additionalPayment,
    required this.payment,
  });
}

abstract final class BasketPageMock {
  static const mock = BasketPageModel(
    title: 'Квадроциклы',
    subtitle: 'Маршрут экстрим',
    address: 'Киевская 59, строение 72',
    visitTime: '02.01.2024 в 09:00',
    visitHour: '1 час',
    visitPrice: '2 500₽',
    contentInfoTitle: 'Важная информация',
    contentInfoSubtitle:
        // ignore: lines_longer_than_80_chars
        'Должен быть опыт вождения мотоциклом. Должна быть справка о том, что можно стрелять из боевого оружия.',
    price: '4 600 ₽',
    additionalPayment: '3 400 ₽',
    payment: '1 200 ₽',
  );
}

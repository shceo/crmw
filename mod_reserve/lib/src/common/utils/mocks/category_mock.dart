// ignore_for_file: lines_longer_than_80_chars

import 'package:mod_reserve/src/common/utils/constants/app_assets.dart';

class Event {
  final String assetPath;
  final String title;
  final String description;
  final List<String> programmeDurationList;
  final String? announcementText;

  const Event({
    required this.assetPath,
    required this.title,
    required this.description,
    required this.programmeDurationList,
    this.announcementText,
  });
}

class Category {
  final String category;
  final int categoryIndex;
  final List<Event> events;

  Category({
    required this.category,
    required this.categoryIndex,
    required this.events,
  });
}

abstract final class CategoryMock {
  static final List<Category> categories = [
    Category(
      category: 'Квадроциклы',
      categoryIndex: 0,
      events: [
        const Event(
          assetPath: AppAssets.quadBikeImage,
          title: 'Маршрут экстрим',
          description:
              'Интересный маршрут, без экстремальных участков. Подойдёт, если катаетесь не в первый раз. Ждем!!!',
          programmeDurationList: [
            '1 час от 3 000₽',
            '2 час от 6 000₽',
            '3 час от 9 000₽',
          ],
        ),
      ],
    ),
    Category(
      category: 'Сауна',
      categoryIndex: 1,
      events: [
        const Event(
          assetPath: AppAssets.saunaImage,
          title: 'Красная сауна',
          description:
              'Полезные свойства прогревания организма, особенно хорошо красная сауна отражается на состоянии кожи.',
          programmeDurationList: [],
          announcementText:
              'Выезд 15.01. Прыжки 16.01 и 17.01. Принимаются бронирования до 10.01 (осталось 10 дней)',
        ),
      ],
    ),
    Category(
      category: 'Шары',
      categoryIndex: 2,
      events: [
        const Event(
          assetPath: AppAssets.ballonsImage,
          title: 'Полёт на воздушном шаре',
          description:
              'Интересный маршрут, без экстремальных участков. Подойдёт, если катаетесь не в первый раз. Ждем!!!',
          programmeDurationList: [
            '1 час от 3 000₽',
          ],
        ),
      ],
    ),
    Category(
      category: 'Роупджампинг',
      categoryIndex: 3,
      events: [
        const Event(
          assetPath: AppAssets.shamanImage,
          title: 'Шаманка, 60 метров',
          description: 'Метр за метром будете лететь 60 метров',
          programmeDurationList: [
            '1 час от 3 000₽',
          ],
          announcementText:
              'Выезд 15.01. Прыжки 16.01 и 17.01. Принимаются бронирования до 10.01 (осталось 10 дней)',
        ),
        const Event(
          assetPath: AppAssets.secondShamanImage,
          title: 'Шаманка, 80 метров',
          description: 'Метр за метром будете лететь 80 метров',
          programmeDurationList: [
            '1 час от 3 000₽',
          ],
        ),
      ],
    ),
  ];
}

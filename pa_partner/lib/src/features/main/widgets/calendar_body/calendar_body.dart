import 'dart:js';

import 'package:common/common_theme_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/common/utils/constants/app_assets.dart';
import 'package:pa_partner/src/features/main/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:common/common_utils_export.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';
import 'package:time_planner/time_planner.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({super.key});

  @override
  _CalendarBodyState createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<CalendarCubit>(
      child: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          return ListView(
            children: [
              CalendarRowT(
                onChanged: (selectedDate) {
                 
                },
              ),
              LocationRow(
                brandServiceAddressList: state.brandServiceAddress,
              ),
              CustomTabBar(tabController: _tabController),
              SizedBox(
                height: context.deviceHeight / 2,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TimePlanner(
                      use24HourFormat: true,
                      style: TimePlannerStyle(
                        dividerColor: Colors.transparent,
                      ),
                      startHour: 7,
                      endHour: 17,
                      headers: const [
                        TimePlannerTitle(
                          date: 'Виктор',
                          title: 'Инструктор №1',
                          dateStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          titleStyle:
                              TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        TimePlannerTitle(
                          date: 'Виктор',
                          title: 'Инструктор №2',
                          dateStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          titleStyle:
                              TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        TimePlannerTitle(
                          date: 'Виктор',
                          title: 'Инструктор №3',
                          dateStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          titleStyle:
                              TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        TimePlannerTitle(
                          date: 'Виктор',
                          title: 'Инструктор №4',
                          dateStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          titleStyle:
                              TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        TimePlannerTitle(
                          date: 'Виктор',
                          title: 'Инструктор №5',
                          dateStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          titleStyle:
                              TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        TimePlannerTitle(
                          date: 'Виктор',
                          title: 'Инструктор №7',
                          dateStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          titleStyle:
                              TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                      tasks: [
                        TimePlannerTask(
                          onTap: () {},
                          minutesDuration: 90,
                          dateTime:
                              TimePlannerDateTime(day: 0, hour: 10, minutes: 0),
                          daysDuration: 1,
                          borderColor: [Color(0xFFF04438)],
                          eventItemBackgroundColors: [
                            Color(0xFFF04438).withOpacity(0.2),
                          ],
                          titleText: '8:00',
                          subtitleText: 'Big title text maybe',
                          thirdSubtitleText: 'some text',
                          titleStyle:
                              TextStyle(fontSize: CommonFonts.sizeTitleMedium),
                          subTitleStyle: const TextStyle(fontSize: 12),
                          thirdTitleStyle: TextStyle(fontSize: 12),
                        ),
                        TimePlannerTask(
                          onTap: () {},
                          minutesDuration: 90,
                          dateTime: TimePlannerDateTime(
                              day: 0, hour: 14, minutes: 50),
                          daysDuration: 1,
                          borderColor: [Color(0xFFF04438)],
                          eventItemBackgroundColors: [
                            Color(0xFFF04438).withOpacity(0.2),
                          ],
                          titleText: '8:00',
                          subtitleText: 'Big title text maybe',
                          thirdSubtitleText: 'some text',
                          titleStyle:
                              TextStyle(fontSize: CommonFonts.sizeTitleMedium),
                          subTitleStyle: const TextStyle(fontSize: 12),
                          thirdTitleStyle: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CalendarRowT extends StatelessWidget {
  const CalendarRowT({required this.onChanged, super.key});
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс']
              .map(
                (day) => Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: context.theme.secondaryTextColor,
                        fontSize: CommonDimensions.mediumLargeforWeek,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 31,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onChanged(index + 1),
                child: Container(
                  width: 50,
                  height: 50,
                  // ignore: lines_longer_than_80_chars
                  margin: const EdgeInsets.symmetric(
                    horizontal: CommonDimensions.small,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: context.theme.calendarBorderColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          fontSize: CommonDimensions.dateSize,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LocationRow extends StatelessWidget {
  const LocationRow({required this.brandServiceAddressList, super.key});
  final List<BrandServiceAddress> brandServiceAddressList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CommonDimensions.mediumLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocationInfo(brandServiceAddressList: brandServiceAddressList),
          const LocationActions(),
        ],
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  const LocationInfo({required this.brandServiceAddressList, super.key});
  final List<BrandServiceAddress> brandServiceAddressList;

  @override
  Widget build(BuildContext context) {
    if (brandServiceAddressList.isEmpty) {
      return const SizedBox(
        child: Row(
          children: [
            CustomVectorImage(
              svgAssetPath: AppAssets.locationIcon,
            ),
            SizedBox(
              width: CommonDimensions.medium,
            ),
            SizedBox(
              width: CommonDimensions.large,
            ),
            CustomVectorImage(
              svgAssetPath: AppAssets.arrowDownIcon,
            ),
          ],
        ),
      );
    }

    final initialValue =
        '${brandServiceAddressList[0].name}, ${brandServiceAddressList[0].city.name}';

    return SimpleDropdown(
      items: [
        for (final address in brandServiceAddressList)
          '${address.name}, ${address.city.name}',
      ],
      customDropdownDecoration: const CustomDropdownDecoration(
        closedSuffixIcon: SizedBox(),
        expandedSuffixIcon: SizedBox(),
      ),
      onChanged: (value) {
        final selectedAddress = brandServiceAddressList.firstWhere(
          (element) => '${element.name}, ${element.city.name}' == value,
        );

        context.read<CalendarCubit>().updateAddressId(
              addressId: selectedAddress.id,
            );
      },
      hintText: initialValue,
      hintBuilder: (hintContext, value) {
        return Row(
          children: [
            const CustomVectorImage(
              svgAssetPath: AppAssets.locationIcon,
            ),
            const SizedBox(
              width: CommonDimensions.medium,
            ),
            Expanded(
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: CommonDimensions.large,
            ),
            const CustomVectorImage(
              svgAssetPath: AppAssets.arrowDownIcon,
            ),
          ],
        );
      },
    );
  }
}

class LocationActions extends StatelessWidget {
  const LocationActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const CustomVectorImage(
            svgAssetPath: AppAssets.arrowSquareIcon,
          ),
        ),
      ],
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({required this.tabController, super.key});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: TabBar(
            controller: tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2, color: context.theme.mainColor),
            ),
            // indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            unselectedLabelColor: context.theme.greyColor,
            labelColor: context.theme.mainColor,
            tabs: const [
              Tab(text: 'Календарь'),
              Tab(text: 'Техника'),
              Tab(text: 'Инструкторы'),
            ],
          ),
        ),
      ],
    );
  }
}

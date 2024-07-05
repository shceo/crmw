import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:pa_partner/src/features/main/widgets/add_body/add_body.dart';
import 'package:pa_partner/src/features/main/widgets/calendar_body/calendar_body.dart';
import 'package:pa_partner/src/features/main/widgets/notification_body/notification_body.dart';
import 'package:pa_partner/src/features/main/widgets/search_body/search_body.dart';
import 'package:pa_partner/src/features/main/widgets/settings_body/settings_body.dart';

class MainBodySelector extends StatefulWidget {
  final PageController pageController;
  const MainBodySelector({
    required this.pageController,
    super.key,
  });

  @override
  State<MainBodySelector> createState() => _MainBodySelectorState();
}

class _MainBodySelectorState extends State<MainBodySelector> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPanelCubit, NavigationPanelState>(
      builder: (context, state) {
        return PageView(
          controller: widget.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            SearchBody(),
            CalendarBody(),
            AddBody(),
            NotificationBody(),
            SettingsBody(),
          ],
        );
      },
    );
  }
}

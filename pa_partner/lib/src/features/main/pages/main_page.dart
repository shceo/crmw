import 'package:common/common_localization_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/di/injector.dart';
import 'package:pa_partner/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:pa_partner/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:pa_partner/src/features/main/widgets/main_body_selector.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _navigationPanelCubit = i.get<NavigationPanelCubit>();

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: _navigationPanelCubit.state.navigationIndex,
    );
  }

  void _panelListener([int? index]) {
    if (index != null) _pageController.jumpToPage(index);
  }

  bool _panelListenWhen(
    NavigationPanelState prev,
    NavigationPanelState current,
  ) {
    return prev.navigationIndex != current.navigationIndex;
  }
  
  String? _appBarTitle(BuildContext context, int pageIndex) =>
      switch (pageIndex) {
        0 => context.locale.search,
        1 => context.locale.calendar,
        2 => null,
        3 => context.locale.notification,
        4 => context.locale.settings,
        _ => throw UnimplementedError(),
      };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationPanelCubit, NavigationPanelState>(
      bloc: _navigationPanelCubit,
      listenWhen: _panelListenWhen,
      listener: (_, state) => _panelListener(state.navigationIndex),
      builder: (context, navState) {
        return BaseNavigationPage(
          appBarTitle: _appBarTitle(context, navState.navigationIndex),
          body: MainBodySelector(
            pageController: _pageController,
          ),
        );
      },
    );
  }
}

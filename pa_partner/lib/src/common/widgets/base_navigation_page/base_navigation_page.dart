import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_partner/src/common/cubit_scope/cubit_scope.dart';
import 'package:pa_partner/src/common/di/injector.dart';
import 'package:pa_partner/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';

class BaseNavigationPage extends StatefulWidget {
  final Widget body;
  final String? appBarTitle;
  const BaseNavigationPage({
    required this.body,
    this.appBarTitle,
    super.key,
  });

  @override
  State<BaseNavigationPage> createState() => _BaseNavigationPageState();
}

class _BaseNavigationPageState extends State<BaseNavigationPage> {
  final _navigationPanel = i.get<NavigationPanelCubit>();

  @override
  Widget build(BuildContext context) {
    return CubitScope<NavigationPanelCubit>(
      child: BlocBuilder<NavigationPanelCubit, NavigationPanelState>(
        bloc: _navigationPanel,
        builder: (context, state) {
          return BasePage(
            appBar: widget.appBarTitle == null
                ? null
                : CustomAppBar(
                    title: widget.appBarTitle,
                  ),
            body: widget.body,
            bottomAppBar: CustomNavigationBar(
              selectedIndex: state.navigationIndex,
              onIndexChanged: _navigationPanel.updateNavigationIndex,
              items: const [
                CustomNavigationItem(iconPath: CommonAssets.searchIcon),
                CustomNavigationItem(iconPath: CommonAssets.calendarIcon),
                CustomNavigationItem(iconPath: CommonAssets.squareAddIcon),
                CustomNavigationItem(iconPath: CommonAssets.notificationIcon),
                CustomNavigationItem(iconPath: CommonAssets.menuIcon),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:common/common_bodies_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:pa_partner/src/features/blocks_page/cubit/blocks_cubit.dart';
import 'package:pa_partner/src/features/blocks_page/widgets/block_card.dart';

class BlocksBody extends StatefulWidget {
  const BlocksBody({
    required this.cubit,
    required this.blocks,
    super.key,
  });

  final BlocksCubit cubit;
  final List blocks;

  @override
  State<BlocksBody> createState() => _BlocksBodyState();
}

class _BlocksBodyState extends State<BlocksBody>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        TabBar(
          controller: tabController,
          dividerColor: context.theme.sevenFoldColor,
          indicatorColor: context.theme.mainColor,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.mainColor,
            fontWeight: CommonFonts.medium,
          ),
          tabs: const [
            Tab(
              // TODO(dev): локализация
              text: 'Блокировки',
            ),
            Tab(
              // TODO(dev): локализация
              text: 'Архив',
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
              tabController.animateTo(index);
            });
          },
        ),
        const SizedBox(height: CommonDimensions.large),
        IndexedStack(
          sizing: StackFit.passthrough,
          index: selectedIndex,
          children: <Widget>[
            if (widget.blocks.isNotEmpty)
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (final _ in widget.blocks) const BlockCard(),
                  CustomButton(
                    // TODO(dev): локализация
                    text: 'Добавить блокировку',
                    textStyle:
                        context.themeData.textTheme.headlineSmall?.copyWith(
                      color: context.theme.quaternaryTextColor,
                      fontWeight: CommonFonts.semiBold,
                    ),
                    appAsset: CommonAssets.smileIcon,
                    assetColor: context.theme.secondaryColor,
                    onTap: () => {},
                  ),
                ],
              ),
            if (widget.blocks.isEmpty)
              MessageScreenBody(
                // TODO(dev): локализация
                title: 'Блокировки',
                subtitle: 'Ничего не найдено! Блокировок нет',
                actionTitle: 'Добавить блокировку',
                onTap: () {},
              ),
            const MessageScreenBody(
              // TODO(dev): локализация
              title: 'Архив',
              subtitle: 'В архив ничего не добавлено',
            ),
          ],
        ),
      ],
    );
  }
}

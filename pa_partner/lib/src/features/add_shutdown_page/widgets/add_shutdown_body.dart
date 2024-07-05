import 'package:chips_choice/chips_choice.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:pa_partner/src/common/widgets/card_with_checkbox_group/card_with_checkbox_group.dart';
import 'package:pa_partner/src/features/add_shutdown_page/cubit/add_shutdown_cubit.dart';

class AddShutdownBody extends StatefulWidget {
  const AddShutdownBody({
    required this.cubit,
    required this.servicesGroup,
    required this.selectedServices,
    required this.programs,
    super.key,
  });
  final AddShutdownCubit cubit;

  final List<Map<String, dynamic>> servicesGroup;

  final List<String> selectedServices;

  final List programs;

  @override
  State<AddShutdownBody> createState() => _AddShutdownBodyState();
}

class _AddShutdownBodyState extends State<AddShutdownBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _startDateController;
  late final TextEditingController _endDateController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: CommonDimensions.extraLarge,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // TODO(dev): локализация
              'Название временной блокировки',
            ),
          ],
        ),
        const SizedBox(
          height: CommonDimensions.mediumLarge,
        ),
        InputField(
          controller: _nameController,
          // TODO(dev): локализация
          hintText: 'Название временной блокировки',
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: CustomVectorImage(
                  svgAssetPath: CommonAssets.infoIcon,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const CustomVectorImage(
                  svgAssetPath: CommonAssets.clearIcon,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: CommonDimensions.extraLarge,
        ),
        const Text(
          // TODO(dev): локализация
          'Отключить на период',
        ),
        const SizedBox(
          height: CommonDimensions.mediumLarge,
        ),
        Row(
          children: [
            CustomVectorButton(
              backgroundColor: context.theme.mainColor,
              assetPath: CommonAssets.calendarIcon,
              isSmall: true,
              assetColor: context.theme.secondaryColor,
              onPressed: _showDateRangePicker,
            ),
            const SizedBox(
              width: CommonDimensions.mediumLarge,
            ),
            Expanded(
              child: InputField(
                controller: _startDateController,
                onTap: _showDateRangePicker,
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(CommonDimensions.large),
                  child: Text(
                    'c',
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: CommonDimensions.mediumLarge,
            ),
            Expanded(
              child: InputField(
                controller: _endDateController,
                onTap: _showDateRangePicker,
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(CommonDimensions.large),
                  child: Text(
                    'до',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: CommonDimensions.extraLarge,
        ),
        const Text(
          // TODO(dev): локализация
          'Выберите программы',
        ),
        const SizedBox(
          height: CommonDimensions.mediumLarge,
        ),
        Container(
          // padding: const EdgeInsets.all(CommonDimensions.large),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CommonDimensions.large),
            border: Border.all(
              color: context.theme.quaternaryColor,
            ),
          ),
          child: ChipsChoice.multiple(
            choiceStyle: C2ChipStyle(
              backgroundColor: context.theme.primaryTextColor,
              shadowColor: context.theme.primaryTextColor,
              foregroundStyle: context.themeData.textTheme.titleSmall?.copyWith(
                color: context.theme.primaryTextColor,
              ),
              iconColor: context.theme.primaryTextColor,
            ),
            value: [...widget.programs, 'tesdd'],
            choiceItems: [
              C2Choice(
                value: 'tesdd',
                label: 'tesdd',
                delete: () {},
              ),
            ],
            onChanged: (value) {},
          ),
        ),
        for (final group in widget.servicesGroup)
          CardWithCheckboxGroup(
            title: group['label'],
            items: group['services'] as List<String>,
            selected: widget.selectedServices,
            onChanged: widget.cubit.toggleService,
          ),
        const SizedBox(
          height: CommonDimensions.extraLarge,
        ),
        CustomButton.text(
          onTap: () {},
          // TODO(dev): локализация

          text: 'Сохранить',
          boxDecoration: BoxDecoration(
            color: context.theme.greenColor,
            borderRadius: BorderRadius.circular(
              CommonDimensions.medium,
            ),
            border: Border.all(
              color: context.theme.greenColor,
            ),
          ),
        ),
      ],
    );
  }

  void _showDateRangePicker() {
    showDialog(
      context: context,
      builder: (context) => CustomDateRangePicker(
        primaryColor: context.theme.mainColor,
        backgroundColor: context.theme.secondaryColor,
        onApplyClick: (
          val1,
          val2,
        ) {
          _startDateController.text = '${val1.day}.${val1.month}.${val1.year}';
          _endDateController.text = '${val2.day}.${val2.month}.${val2.year}';
        },
        minimumDate: DateTime.now(),
        maximumDate: DateTime.now().add(const Duration(days: 31)),
        onCancelClick: () => null,
      ),
    );
  }
}

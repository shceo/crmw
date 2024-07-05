import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:pa_partner/src/common/widgets/card_with_checkbox_group/card_with_checkbox_group.dart';
import 'package:pa_partner/src/features/add_block_page/cubit/add_block_cubit.dart';

class AddBlockBody extends StatefulWidget {
  const AddBlockBody({
    required this.cubit,
    required this.brandsGroup,
    required this.selectedBrands,
    super.key,
  });
  final AddBlockCubit cubit;
  final List<Map<String, dynamic>> brandsGroup;
  final List selectedBrands;
  @override
  State<AddBlockBody> createState() => _AddBlockBodyState();
}

class _AddBlockBodyState extends State<AddBlockBody> {
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
        const Text(
          // TODO(dev): локализация
          'Временное отключение бренда',
        ),
        const SizedBox(
          height: CommonDimensions.extraLarge,
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
                    // TODO(dev): локализация

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
                    // TODO(dev): локализация
                    'до',
                  ),
                ),
              ),
            ),
          ],
        ),
        for (final group in widget.brandsGroup)
          CardWithCheckboxGroup(
            onChanged: ({
              required String label,
              bool? value,
            }) =>
                widget.cubit.toggleBrand(
              label: label,
              value: value,
            ),
            title: group['label']! as String,
            items: group['brands']! as List<String>,
            selected: widget.selectedBrands,
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
    SupportMethods.showCrmDialog(
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

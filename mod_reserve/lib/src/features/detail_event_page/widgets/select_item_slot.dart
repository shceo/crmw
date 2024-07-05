import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:core/domain/entities/brand_service_denomination/brand_service_denomination.dart';
import 'package:flutter/cupertino.dart';

class SelectItemSlot extends StatefulWidget {
  final List<BrandServiceDenomination>? brandServiceDenomination;
  final Function(Map<String, int>)? counterCallback;
  const SelectItemSlot({
    required this.brandServiceDenomination,
    required this.counterCallback,
    super.key,
  });

  @override
  State<SelectItemSlot> createState() => SelectItemSlotState();
}

class SelectItemSlotState extends State<SelectItemSlot> {
  Map<int, int> countedValuesMap = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Выберите или добавьте опции',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: CommonFonts.medium,
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        Text(
          'Выберите количество человек и опции',
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: CommonFonts.regular,
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        // for (final slot in widget.brandServiceDenomination!)
        for (int i = 0; i < widget.brandServiceDenomination!.length; i++)
          Container(
            // padding: const EdgeInsets.all(CommonDimensions.large),
            margin: const EdgeInsets.only(bottom: CommonDimensions.large),
            width: context.adaptiveDeviceWidth,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  CommonDimensions.large,
                ),
              ),
              border: Border.all(
                color: context.theme.quaternaryColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(CommonDimensions.large),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.brandServiceDenomination![i].name,
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.primaryTextColor,
                          fontWeight: CommonFonts.semiBold,
                        ),
                      ),
                      const SizedBox(height: CommonDimensions.large),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // ignore: lines_longer_than_80_chars
                            'Из ${widget.brandServiceDenomination![i].freeResourcesCount} доступных',
                            style: context.themeData.textTheme.headlineSmall
                                ?.copyWith(
                              color: context.theme.mainColor,
                              fontWeight: CommonFonts.regular,
                            ),
                          ),
                          CustomCounter(
                            counterCallback: (value) {
                              if (widget.counterCallback != null) {
                                // ignore: prefer_null_aware_method_calls
                                widget.counterCallback!(
                                  {
                                    'id':
                                        widget.brandServiceDenomination![i].id,
                                    'count': value,
                                  },
                                );
                              }
                              setState(() {
                                countedValuesMap[i] = value;
                              });
                            },
                            initNumber: 0,
                            minNumber: 0,
                            maxNumber: 10,
                            // maxNumber: slot.freeResourcesCount,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: CommonDimensions.small),
                if (countedValuesMap.containsKey(i) && countedValuesMap[i]! > 0)
                  Container(
                    padding: const EdgeInsets.all(CommonDimensions.large),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: context.theme.divider,
                        ),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(
                          CommonDimensions.large,
                        ),
                        bottomRight: Radius.circular(
                          CommonDimensions.large,
                        ),
                      ),
                      color: context.theme.quaternaryColor.withOpacity(.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Итого',
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                            fontWeight: CommonFonts.semiBold,
                          ),
                        ),
                        Text(
                          // ignore: lines_longer_than_80_chars
                          '${countedValuesMap[i]! * double.parse(widget.brandServiceDenomination![i].brandServicePriceDefault.value ?? '')} ${widget.brandServiceDenomination![i].brandServicePriceDefault.brandServiceCurrency.symbol}',
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                            fontWeight: CommonFonts.regular,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:common/common_localization_export.dart';
import 'package:common/common_theme_export.dart';
import 'package:common/common_utils_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:core/domain/entities/brand_service_address/brand_service_address.dart';
import 'package:core/domain/entities/brand_service_programme/brand_service_programme.dart';
import 'package:core/domain/entities/brand_service_type/brand_service_type.dart';
import 'package:flutter/material.dart';
import 'package:mod_reserve/src/common/utils/constants/app_assets.dart';
import 'package:mod_reserve/src/features/search_event_page/cubit/search_event_cubit.dart';

class SearchEventBody extends StatefulWidget {
  final SearchEventCubit searchEventCubit;
  final List<BrandServiceType> brandServiceTypeList;
  final List<BrandServiceAddress> brandServiceAddressList;
  final List<BrandServiceProgramme> brandServiceProgrammeList;
  const SearchEventBody({
    required this.searchEventCubit,
    required this.brandServiceTypeList,
    required this.brandServiceAddressList,
    required this.brandServiceProgrammeList,
    super.key,
  });

  @override
  State<SearchEventBody> createState() => _SearchEventBodyState();
}

class _SearchEventBodyState extends State<SearchEventBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: selectedIndex,
      length: widget.brandServiceTypeList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(CommonDimensions.commonPadding),
      children: [
        Row(
          children: [
            Expanded(
              child: SimpleDropdown(
                items: [
                  for (final address in widget.brandServiceAddressList)
                    '${address.name}, ${address.city.name}',
                ],
                customDropdownDecoration: const CustomDropdownDecoration(
                  closedSuffixIcon: SizedBox(),
                  expandedSuffixIcon: SizedBox(),
                ),
                onChanged: (value) {
                  final addresses = widget.brandServiceAddressList;

                  final selectedAddress = addresses.firstWhere(
                    (element) =>
                        '${element.name}, ${element.city.name}' == value,
                  );

                  widget.searchEventCubit.updateAddressId(
                    addressId: selectedAddress.id,
                  );
                },
                hintText:
                    // ignore: lines_longer_than_80_chars
                    '${widget.brandServiceAddressList[0].name}, ${widget.brandServiceAddressList[0].city.name}',
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
                headerBuilder: (headerContext, value) {
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
              ),
            ),
            const SizedBox(width: CommonDimensions.medium),
            Text(
              context.locale.onTheMap,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.tertiaryTextColor,
                fontWeight: CommonFonts.medium,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              context.locale.selectProgramme,
              style: context.themeData.textTheme.displayLarge?.copyWith(
                fontWeight: CommonFonts.medium,
              ),
            ),
            const Spacer(),
            const CustomVectorImage(
              svgAssetPath: AppAssets.imagesIcon,
            ),
            const SizedBox(width: CommonDimensions.large),
          ],
        ),
        const SizedBox(height: CommonDimensions.large),
        Text(
          context.locale.categories,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            fontWeight: CommonFonts.medium,
          ),
        ),
        const SizedBox(height: CommonDimensions.medium),
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: context.theme.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.theme.mainColor.withOpacity(.8),
                context.theme.mainColor,
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.large,
              ),
            ),
          ),
          labelStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.tertiaryColor,
            fontWeight: CommonFonts.medium,
          ),
          tabs: [
            for (final category in widget.brandServiceTypeList)
              Tab(
                text: category.serviceType.name,
              ),
          ],
          onTap: (int index) {
            final categories = widget.brandServiceTypeList;
            widget.searchEventCubit
              ..updateCategoryId(
                categoryId: categories[index].id,
              )
              ..updateCategoryName(
                categoryName: categories[index].serviceType.name,
              );
            setState(() {
              selectedIndex = index;
              _tabController.animateTo(index);
            });
          },
        ),
        const SizedBox(height: CommonDimensions.large),
        IndexedStack(
          index: selectedIndex,
          children: <Widget>[
            for (final programme in widget.brandServiceProgrammeList)
              ProgrammeItem(
                assetPath: programme.brandServicePhotos.first.image,
                title: programme.name,
                description: programme.description,
                onTap: () => widget.searchEventCubit.navigateToDetailPage(
                  programmeId: programme.id,
                ),
                programmeDurationList:
                    programme.brandServiceProgramExactDuration,
              ),
          ],
        ),
      ],
    );
  }
}

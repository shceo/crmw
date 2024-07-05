part of 'search_event_cubit.dart';

final class SearchEventState extends Equatable {
  final CustomRoute route;
  final List<BrandServiceAddress>? brandServiceAddress;
  final List<BrandServiceType>? brandServiceType;
  final List<BrandServiceProgramme>? brandServiceProgramme;
  final List<BrandServiceDetailProgramme>? brandServiceDetailProgramme;
  final int categoryId;
  final int programmeId;
  final int addressId;
  final String categoryName;
  @override
  List<Object?> get props => [
        route,
        brandServiceAddress,
        brandServiceType,
        brandServiceProgramme,
        categoryId,
        programmeId,
        addressId,
        categoryName,
      ];

  const SearchEventState({
    required this.route,
    required this.brandServiceAddress,
    required this.brandServiceType,
    required this.brandServiceProgramme,
    required this.brandServiceDetailProgramme,
    required this.categoryId,
    required this.programmeId,
    required this.addressId,
    required this.categoryName,
  });

  SearchEventState copyWith({
    CustomRoute? route,
    List<BrandServiceAddress>? brandServiceAddress,
    List<BrandServiceType>? brandServiceType,
    List<BrandServiceProgramme>? brandServiceProgramme,
    List<BrandServiceDetailProgramme>? brandServiceDetailProgramme,
    int? categoryId,
    int? programmeId,
    int? addressId,
    String? categoryName,
  }) {
    return SearchEventState(
      route: route ?? this.route,
      brandServiceAddress: brandServiceAddress ?? this.brandServiceAddress,
      brandServiceType: brandServiceType ?? this.brandServiceType,
      brandServiceProgramme:
          brandServiceProgramme ?? this.brandServiceProgramme,
      brandServiceDetailProgramme:
          brandServiceDetailProgramme ?? this.brandServiceDetailProgramme,
      categoryId: categoryId ?? this.categoryId,
      programmeId: programmeId ?? this.programmeId,
      addressId: addressId ?? this.addressId,
      categoryName: categoryName ?? this.categoryName,
    );
  }
}

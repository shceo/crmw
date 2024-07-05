import 'package:core/domain/entities/domain_object.dart';

final class BrandServiceVideos extends DomainObject {
  final int id;
  final String code;
  final String video;
  final bool isActive;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        code,
        video,
        isActive,
      ];

  const BrandServiceVideos({
    required this.id,
    required this.code,
    required this.video,
    required this.isActive,
  });

  @override
  BrandServiceVideos copyWith() {
    return BrandServiceVideos(
      id: id,
      code: code,
      video: video,
      isActive: isActive,
    );
  }
}

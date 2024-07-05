import 'package:core/domain/entities/domain_object.dart';

final class ServiceType extends DomainObject {
  final String name;
  final String image;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        image,
      ];

  const ServiceType({required this.name, required this.image});

  @override
  ServiceType copyWith() {
    return ServiceType(
      name: name,
      image: image,
    );
  }
}

// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

abstract class DomainObject extends Equatable {
  const DomainObject();

  DomainObject copyWith();
}

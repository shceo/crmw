import 'package:common/src/navigation/page_arguments.dart';
import 'package:equatable/equatable.dart';

class PageConfiguration extends Equatable {
  final String path;
  final PageArguments? args;
  final Map<String, String>? pathParameters;

  @override
  List<Object?> get props => [
        path,
        args,
      ];

  const PageConfiguration({
    required this.path,
    this.args,
    this.pathParameters,
  });

  PageConfiguration copyWith({
    String? path,
    PageArguments? args,
  }) {
    return PageConfiguration(
      path: path ?? this.path,
      args: args ?? this.args,
    );
  }
}

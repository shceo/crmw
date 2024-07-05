part of 'blocks_cubit.dart';

final class BlocksState extends Equatable {
  final List blocks;

  @override
  List<Object?> get props => [blocks];

  const BlocksState({
    required this.blocks,
  });

  BlocksState copyWidth({List? blocks, bool? isLoading}) {
    return BlocksState(
      blocks: blocks ?? this.blocks,
    );
  }
}

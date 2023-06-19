import 'package:equatable/equatable.dart';

class MoveDetailsParameter extends Equatable {
  final int id;

  const MoveDetailsParameter({required this.id});

  @override
  List<Object> get props => [id];
}
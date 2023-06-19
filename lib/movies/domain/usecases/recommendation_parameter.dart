import 'package:equatable/equatable.dart';

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];

}
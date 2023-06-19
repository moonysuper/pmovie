import 'package:equatable/equatable.dart';
import 'package:pmovie/movies/domain/entities/genres.dart';

class MovieDetails  extends Equatable{
  final int id;
  final List<Genres> genres;
  final String title;
  final String bgPatch;
  final String overView;
  final String releaseDate;
  final int runTime;
  final double voteAverage;

  const MovieDetails({
    required this.id,
    required this.genres,
    required this.title,
    required this.bgPatch,
    required this.overView,
    required this.releaseDate,
    required this.runTime,
    required this.voteAverage,
  });
  @override
  List<Object> get props =>
      [
        id,
        genres,
        title,
        bgPatch,
        overView,
        releaseDate,
        runTime,
        voteAverage,
      ];
}

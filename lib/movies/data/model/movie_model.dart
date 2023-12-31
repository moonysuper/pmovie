import 'package:pmovie/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.bgPatch,
    required super.genreIds,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String,dynamic> json) => MovieModel(
    id: json["id"],
    title: json["title"],
    bgPatch: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
    overView: json["overview"],
    voteAverage: json["vote_average"].toDouble(),
    releaseDate: json["release_date"]
  );
}

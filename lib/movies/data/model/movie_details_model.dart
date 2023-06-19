import 'package:pmovie/movies/data/model/genres.dart';
import 'package:pmovie/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails{
  const MovieDetailsModel({required super.id, required super.genres, required super.title, required super.bgPatch, required super.overView, required super.releaseDate, required super.runTime, required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String,dynamic> json) => MovieDetailsModel(
    bgPatch: json["backdrop_path"],
    id: json["id"],
    overView: json["overview"],
    releaseDate: json["release_date"],
    title: json["title"],
    runTime: json["runtime"],
    voteAverage: json["vote_average"].toDouble(),
    genres: List.from(json["genres"].map((x) => GenresModel.fromJson(x))
    )
  );


}
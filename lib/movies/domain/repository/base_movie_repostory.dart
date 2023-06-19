import 'package:dartz/dartz.dart';
import 'package:pmovie/core/error/failure.dart';
import 'package:pmovie/movies/data/model/movie_details_parameter.dart';
import 'package:pmovie/movies/domain/entities/movie.dart';
import 'package:pmovie/movies/domain/entities/movie_details.dart';
import 'package:pmovie/movies/domain/entities/recommendation.dart';
import 'package:pmovie/movies/domain/usecases/recommendation_parameter.dart';




abstract class BaseMovieRepository {

  Future<Either<Failure,List<Movie>>> getNowPlaying();
  Future<Either<Failure,List<Movie>>> getPopularMovie();
  Future<Either<Failure,List<Movie>>> getTopRated();
  Future<Either<Failure, MovieDetails>> getMovieDetails(MoveDetailsParameter parameter);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

}
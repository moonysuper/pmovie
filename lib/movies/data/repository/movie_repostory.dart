import 'package:dartz/dartz.dart';
import 'package:pmovie/core/error/exception.dart';
import 'package:pmovie/core/error/failure.dart';
import 'package:pmovie/movies/domain/entities/movie.dart';
import 'package:pmovie/movies/domain/entities/movie_details.dart';
import 'package:pmovie/movies/domain/entities/recommendation.dart';
import 'package:pmovie/movies/domain/repository/base_movie_repostory.dart';


import '../datasource/movie_remote_datasource.dart';

class MovieRepository extends BaseMovieRepository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlaying() async {
    final result =  await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
    return Right(result);
    } on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie() async {
    final result =  await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRated() async{
    final result =  await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(parameter) async {
    final result =  await baseMovieRemoteDataSource.getMovieDetails(parameter);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(parameters) async{
    final result =  await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }







}
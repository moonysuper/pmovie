import 'package:dio/dio.dart';
import 'package:pmovie/core/error/exception.dart';
import 'package:pmovie/core/network/error_message_model.dart';
import 'package:pmovie/movies/data/model/movie_details_model.dart';
import 'package:pmovie/movies/data/model/movie_details_parameter.dart';
import 'package:pmovie/movies/data/model/recommendation_model.dart';
import 'package:pmovie/movies/domain/usecases/recommendation_parameter.dart';
import '../../../core/network/api_constance.dart';
import '../model/movie_model.dart';

abstract class  BaseMovieRemoteDataSource {

  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MoveDetailsParameter parameter);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameter);

}



class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async{
    final response = await Dio().get(ApiConstance.nowPlayingMovie);
    if(response.statusCode == 200)
      {
        return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
      }
    else
      {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(ApiConstance.nowPopularMovies);
    if(response.statusCode == 200)
    {
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }
    else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.nowTopRatedMovies);
    if(response.statusCode == 200)
    {
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }
    else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MoveDetailsParameter parameter) async {
    final response = await Dio().get(ApiConstance.movieDetailPath(parameter.id));
    if(response.statusCode == 200)
    {
      return MovieDetailsModel.fromJson(response.data);
    }
    else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameter) async{
    final response = await Dio().get(ApiConstance.recommendationPath(parameter.id));
    if(response.statusCode == 200)
    {
      return List<RecommendationModel>.from((response.data["results"] as List).map((e) => RecommendationModel.fromJson(e)));
    }
    else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}
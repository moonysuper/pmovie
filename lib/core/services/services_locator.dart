import 'package:get_it/get_it.dart';
import 'package:pmovie/movies/data/datasource/movie_remote_datasource.dart';
import 'package:pmovie/movies/data/repository/movie_repostory.dart';
import 'package:pmovie/movies/domain/repository/base_movie_repostory.dart';
import 'package:pmovie/movies/domain/usecases/get_Popular_Movie_usercase.dart';
import 'package:pmovie/movies/domain/usecases/get_Top_Rated_usecase.dart';
import 'package:pmovie/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:pmovie/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:pmovie/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:pmovie/movies/presentation/controller/movie_bloc.dart';
import 'package:pmovie/movies/presentation/controller/movie_details_bloc.dart';

final ls = GetIt.instance;
class ServiceLocator{
  void init()
  {
    /// Bloc Movie
    ls.registerFactory(() => MovieBloc(ls(),ls(),ls()));
    ls.registerFactory(() => MovieDetailsBloc(ls(),ls()));

    /// DataSource L s
    ls.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    /// Repository
    ls.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(ls()));
    /// UseCases
    ls.registerLazySingleton(() => GetNowPlayingUseCase(ls()));
    ls.registerLazySingleton(() => GetPopularMovieUseCase(ls()));
    ls.registerLazySingleton(() => GetPTopRatedUseCase(ls()));
    ls.registerLazySingleton(() => GetMovieDetailsUseCase(ls()));
    ls.registerLazySingleton(() => GetRecommendationUseCase(ls()));
  }
}

import 'package:dartz/dartz.dart';
import 'package:pmovie/core/error/failure.dart';
import 'package:pmovie/core/usecases/base_usecase.dart';
import 'package:pmovie/movies/domain/entities/recommendation.dart';
import 'package:pmovie/movies/domain/repository/base_movie_repostory.dart';
import 'package:pmovie/movies/domain/usecases/recommendation_parameter.dart';


class GetRecommendationUseCase extends BaseUseCases<List<Recommendation>,RecommendationParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameter) async {
    return await baseMovieRepository.getRecommendation(parameter);
  }




}


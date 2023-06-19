


import 'package:dartz/dartz.dart';

import 'package:pmovie/core/error/failure.dart';
import 'package:pmovie/core/usecases/base_usecase.dart';
import 'package:pmovie/movies/data/model/movie_details_parameter.dart';
import 'package:pmovie/movies/domain/entities/movie_details.dart';
import 'package:pmovie/movies/domain/repository/base_movie_repostory.dart';


class GetMovieDetailsUseCase extends BaseUseCases<MovieDetails, MoveDetailsParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MoveDetailsParameter parameter) async {
    return await baseMovieRepository.getMovieDetails(parameter);
  }


}


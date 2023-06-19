import 'package:dartz/dartz.dart';
import 'package:pmovie/core/error/failure.dart';
import 'package:pmovie/core/usecases/base_usecase.dart';
import 'package:pmovie/movies/domain/entities/movie.dart';
import 'package:pmovie/movies/domain/repository/base_movie_repostory.dart';


class GetPTopRatedUseCase extends BaseUseCases<List<Movie>,NoParameter>{
  final BaseMovieRepository baseMovieRepository;
  GetPTopRatedUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async{
    return await baseMovieRepository.getTopRated();
  }



}